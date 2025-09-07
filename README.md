Estimates Binding Energy (KJ/mol) from multiple pullf.xvg and pullx.xvg files.

For Running Multiple SMD
{
for i in $(seq 1 100)
do
	gmx grompp -f pull.mdp -c npt.gro -p topol.top -r npt.gro -n index.ndx -t npt.cpt -o pull$i.tpr
	gmx mdrun -v -deffnm pull$i -pf pullf$i.xvg -px pullx$i.xvg
done
}
