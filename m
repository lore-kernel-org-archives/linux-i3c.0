Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CA6CCD98E4
	for <linux-i3c@archiver.kernel.org>; Wed, 17 Jun 2026 15:28:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GTZrnABcabK0iAYQabFmL0dqdVM4LzBjzNNNcX73mPA=; b=AASZ3xAF9fUN/U
	czySDysQCSI1s2178cVNXwARsoPojbkvQe0wluhVGiSco4HZqeiOpJTlgwFESx4cnxfwRbAJ+nPLO
	CZNycy0R4/AuZC1y1MXbLbanNBOFTPwHYFCbI7aOa3mfknDKx0y87aqRa4rfExyMq/DSo+xVjukrA
	s7Ce/9lG7dtsAKUvyqvWMWsKnQHmXeXJk0O69loKJivdyyYKkc0/Loi7//kWMl22Uub1V+4ZaG4Fe
	VmrehAAIObZFiOicvgtk2Nbu48SL2wtMjqsN0S7TebEXpqAtRpI1S7Ml7VVQ/9hFR4A2cJSJSFvI6
	FfFjJxT16usMV8XN03jg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZsBq-0000000HZ6Y-3Jkj;
	Wed, 17 Jun 2026 15:28:30 +0000
Received: from mail-swedencentralazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c202::7] helo=GVXPR05CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZsBn-0000000HZ5P-2mOY
	for linux-i3c@lists.infradead.org;
	Wed, 17 Jun 2026 15:28:29 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pPaIw8HzJj6grg3dZoyecQPGDOSWEY7PFxOUwz9RsqGr4aDKzGF+bRrnfM0FpXX/j2TDPR/66Ngl2ez2Bb44QljmR8ZuAQ40ngqmQ12BW5Rei8ggLpJc5B/bxcmVQLEZTKyG3xH/i6vM9UIc1YDpJBSTSQ+2XGuySLIpVo83dwUVHn9wFiLed4Z/p6YkKZHpoqoWRPkEbsekNOvVi0F4Mv0Of9tr5sV6kEJdKRdV+4BgvXCOAN8ZxcJI+G/vcz5QEe0WqvJ2cMrGaZmVrznh1WDwL5CZp35L90eg+7TXUmN69aspkVpklQHa10Lt47IKGiyoK6F0Gu0aMy5po9XAQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bI2edrsASfwwaCCmDFAvAA09SEz83RRNFSPGhlB+H0k=;
 b=DawAJpEzP6aiGKZsBc9yVwG186B8arKrY9znK60dglee/2ZJn8AdcT4cX0e5bjLUt/y15ZT87+RgU5ReCYpjk43C9jp61A9s8xFZMkCN9JTbVMd4ykmNNuHLy3KhIFpRuytF3zbv4dmRw4Ifqu+UjqjFPU1eEe4tRD9veBrCMLQnj8bENDg403qdUsIl7eBm5RVo/I2sPEQz0nO1qNHnSpTRpMit6WBjc6yG5yvFLm5W4Gmdk2rMYBFUULh5KYOy0wLw60sn/7dwvIId88W5y7bmSksBRN8otyEYe2XOCzB9AuyvqJxabpJ2DtkPrJ9U/NsuLnYiHR4uM9UNQsDNrQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bI2edrsASfwwaCCmDFAvAA09SEz83RRNFSPGhlB+H0k=;
 b=UQtzHAMO/zth3oloDmd70V4CUakx2h8w1oPvFXa97mFzsaUY8DtNLXv1ZdeyWcQ8EY/3YWtiXkHQc0rMQa2Jd59zC+WVRBPMiiGqC5jBWpvs9nXfCpOrRT5rW+2UsZpSr4ZBzpwm7E3mHvgAdhf+2g/XxmSMEydsNQiWv0TV6UINZIwVuE3lTs270lxY/Z1PZWYx6CZiVmb4vgX9S0FhSw2r5/Ppl+2i1ATeYVddkodKgnYHJjvmYkcgZa9Ooey/fOMmqTqn7vtg+RmJe521H5UAJLucpU8Ri14EJ01QDRyhT5YX8tpSyyjLfxYN0+fYXYQ2nU+nCcpqK994x8ZYLA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by AM0PR04MB7171.eurprd04.prod.outlook.com (2603:10a6:208:19c::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.11; Wed, 17 Jun
 2026 15:28:21 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%6]) with mapi id 15.21.0113.015; Wed, 17 Jun 2026
 15:28:20 +0000
Date: Wed, 17 Jun 2026 11:28:13 -0400
From: Frank Li <Frank.li@oss.nxp.com>
To: sashiko-reviews@lists.linux.dev
Cc: Lakshay Piplani <lakshay.piplani@nxp.com>, devicetree@vger.kernel.org,
	robh@kernel.org, linux-i3c@lists.infradead.org, Frank.Li@kernel.org,
	conor+dt@kernel.org
Subject: Re: [PATCH v12 6/7] i3c: hub: p3h2x4x: Add support for NXP P3H2x4x
 I3C hub functionality
Message-ID: <ajK9DceV1NICNuus@lizhi-Precision-Tower-5810>
References: <20260617110355.1591844-1-lakshay.piplani@nxp.com>
 <20260617110355.1591844-7-lakshay.piplani@nxp.com>
 <20260617111846.EAB851F000E9@smtp.kernel.org>
Content-Disposition: inline
In-Reply-To: <20260617111846.EAB851F000E9@smtp.kernel.org>
X-ClientProxiedBy: SN7PR04CA0231.namprd04.prod.outlook.com
 (2603:10b6:806:127::26) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|AM0PR04MB7171:EE_
X-MS-Office365-Filtering-Correlation-Id: e6938f9e-15b3-4fb0-6c4a-08decc850fe0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|19092799006|23010399003|1800799024|18002099003|22082099003|11063799006|4143699003|3023799007|56012099006|6133799003;
X-Microsoft-Antispam-Message-Info: LoLBNKqUkPDGD6DWpOxlljvG3glxNDJ/LjrrPr81Xaqzmz7PVPbq11alXuczMhSYHN+irs0s0grj+gpwaGAsCc8zjFlmDPPaYFScGdDobdJd+8NbyIBgyfsb32jSc5QYGqWXRu804ICtK9X0AvMkhA+/jNGHTS0J687GECP+ZL29ih1Aa0FaRKLElfipMNQbHYmEqjoLhcJagfGerDxg0RMcir4t7xTOdpj2dx31FGpyr9yEpF+6VRffIkCjturxLN6yZR1D3zvxEF26flxtksu7Ia9X1xEwQasGCwXeWdk7yM3dehz/Q2kGQbc7CNbPDOjBaa9Pe4lwdWJQMi6mcQO/GsDlBJCjKeNW9PNArPbfy1um/Hq+AboZ2/rVqIK7cKb0SF+IxOT+rqHz9CwVCjNzbHkEvygIs6GdopDzyJRgPfLFyi6yR7dxNfCFadQwmm0DF5sXGpIq8QNVprwHcI/Xwd0CMLu2LJ5OAzITRyv4/2qJm/UbwIdR/5EedD1YVK5GWTEw/qY64F4gLA7JKsXpgCQ4/PJKoQ4S02x559V5xOlJQLc36mTO2+W0+YWsOPdKcQ9+S1i8lmo+kZ789sz1+i0Rnrdk6B5K8SltIk3jAS5fcE/jOjal+JvX4Todwb/FtkeTOMQOC9sYScg9/g==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(19092799006)(23010399003)(1800799024)(18002099003)(22082099003)(11063799006)(4143699003)(3023799007)(56012099006)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?zDNgyPT9D2duIBghvIbAAQl4AVo6ND8nSm9XIlloIuccSfS5CS5dfueBht?=
 =?iso-8859-1?Q?YRaImfMfhs2ODDAd69HhRgFbrcwTH4VwwsjZmas0klqsTKZPDVHk5n/Xim?=
 =?iso-8859-1?Q?9unnWcvl53nBGhc+7mpC5LhWVXcHInN9ggQnvkF5qUZonjPuTeNd8XU3IW?=
 =?iso-8859-1?Q?1BfClExwC3dmAoy90ov+nX+psXdkSlaVLhB8bS7WSwx69ER1p69tVMCrE3?=
 =?iso-8859-1?Q?h/nXZkTxgyXLD5VHxh5y17QuJLs1a6kVSfoZaFKL3yb949wCQxVYuOr+sd?=
 =?iso-8859-1?Q?vRJPEQ2J3IKTd73+McZ+9L4RmLhEQf1VqQskVpsoQNpQjR3BpPgs8vszR8?=
 =?iso-8859-1?Q?WSi9GaIGXXZwe3pmBIupAM6AMjGIlOF9noRKUviccHesxttt6epflS8sUV?=
 =?iso-8859-1?Q?70YbYsNK/xndJG9Z/C/iU51R7Ep2MAnT2npDyCz17ydMMmo8VUjTRL9IcC?=
 =?iso-8859-1?Q?OvTUnBalWk4R/yhBV58hCFDG5bYQx2RVx1a7Qh7dpe6iH4EU1mzarVQCiM?=
 =?iso-8859-1?Q?gdAiAeRlykKsrtjtsjz/C3c1Kgx3fIaGHB3v6g/bMHCZC3XmqpLz4EURci?=
 =?iso-8859-1?Q?f/oFjHs61kuctYjy7lR8awfJ4QRLy4LAbz0L+OGoE/eBJthHokVvToZXCJ?=
 =?iso-8859-1?Q?OCkaBiuw9/zyseaNa8DQjwyf5r3QQLbC3dglJdUiHikwvjgWIxBwF5QKzy?=
 =?iso-8859-1?Q?FJJ77+npHoGrdqBogglPIQtH0X6xsrsqmF4PBOillYDXQg4QHIiCb46gUW?=
 =?iso-8859-1?Q?/+Zm3wuAs51lxkDxwvA/mc/MTfW9wMZVrwvQXJlOQ5GEzJU3XMki1qo+5z?=
 =?iso-8859-1?Q?WvH+a2P2LpqPVMb1NN5u7YdE+QVfIPIwBZxetKeanYsHzqKplyhumY9Nzv?=
 =?iso-8859-1?Q?kY6idw1jfd7yoZovQ95G2zNsrQnbG4Fvc1vuy93GqIaPq8qowozDY4THDu?=
 =?iso-8859-1?Q?6y3sVS/I7w7bYm5pnxjS9miQo8qGkGIUkgsUsgWM3i4yf7aQFKDbAJXlDJ?=
 =?iso-8859-1?Q?2sO2Ba4q1fTqtFA5K1OPPAmXxZgOnrMhZ1FuQHsUwqtwtpjkrVzsv8qc8h?=
 =?iso-8859-1?Q?aXJhhUpggqWqjVVhXM76lE/ERsLB6w818fnsFy+1iN1LxKyWZ12XECORHv?=
 =?iso-8859-1?Q?LaF6HM4qbdWGwzqQJGqiQmn46w+KrC0WZbGr8dgO0+f1kk/OyPnqOMUFIN?=
 =?iso-8859-1?Q?Kpoe1qadDzDlRoYAHhUzyKxpBoO7ltB7/LIfn7LnTppA1Q2BiCMxOfIi3f?=
 =?iso-8859-1?Q?GgbwZbzzHWqCo/qoH0wpEH7CHHH0XvcJi9PtPiN9fXRS9FX1RI7z+5p5vC?=
 =?iso-8859-1?Q?5KdYOwUdwjeTU3Hk+NruVAhifIxMh6qnpGGp6KweDr3EemG5jCuqgtFLdi?=
 =?iso-8859-1?Q?vKvjbXOlv98tuee+xsHfz/h3M5f8Czj/LwrHcAE3edlskk4JeNUs1jhqtg?=
 =?iso-8859-1?Q?oB2rgGFSWkHDQ50ECNNsl00CCdXpilkKmtSgvjLL0inDPT0j4oQCioRUX1?=
 =?iso-8859-1?Q?JvqjpI/PSEyiXA1P+JKDm9/iHd0EC3lDQHM0jQtC3fhy0FhFA1F7FZ8A3n?=
 =?iso-8859-1?Q?I5LqBQ3vCNS8vcx4MXTW6scqoqA6FfJykng9k7GRGzTWgJJm74ju5svTHM?=
 =?iso-8859-1?Q?WhKho/pFXAoqJPdi/SPbkuxJxZCTuIBTLOv1Qn3VHowV7+PHpnAA1vmLxJ?=
 =?iso-8859-1?Q?j1pp6rzzw+t421SeyfhW/d1qe8fjZ6j3vMzDtgCpX5HTtKpS80P1B9r0x2?=
 =?iso-8859-1?Q?+EmSN8zzN+iwrzllsKL6OLd5gRAE1VOK27R5h9Mtt5sRNV3nk5YLKaImq4?=
 =?iso-8859-1?Q?FwRl5l/pf7zR6pJzqVTVRiQZD2BzYD+pIBkVC6CflBolUq+d/lza?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e6938f9e-15b3-4fb0-6c4a-08decc850fe0
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2026 15:28:20.5672
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4uJ0aZPotzqgaJoBJuAuL6n8Fa0BfQuyZ29DHxZ64uFOtHT0e3idNdu92EaCUF6ll1T0FNy7EDTPEAj0m+rQZ55/m5CiHYr4/ZAhz8AnAPv6A4dLPDtYxdBiUn4Ixpbn
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB7171
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260617_082827_705862_94CF1B33 
X-CRM114-Status: GOOD (  39.62  )
X-BeenThere: linux-i3c@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-i3c.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-i3c>,
 <mailto:linux-i3c-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-i3c/>
List-Post: <mailto:linux-i3c@lists.infradead.org>
List-Help: <mailto:linux-i3c-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-i3c>,
 <mailto:linux-i3c-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org

On Wed, Jun 17, 2026 at 11:18:46AM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 5 potential issu=
e(s) to consider:
> - [High] The SMBus transaction wait logic uses a fixed sleep instead of p=
olling the hardware completion flag, leading to premature reads of incomple=
te transactions and data corruption.
> - [High] Overwriting the parent device's `of_node` pointer iteratively ca=
uses a memory leak of the original parent node, a double-free of the target=
 port nodes, and state corruption.
> - [Medium] Potential `of_node` reference leak in `p3h2x4x_get_target_port=
_dt_conf()` if multiple child nodes specify the same target port index.
> - [Medium] The hub's protected registers remain permanently unlocked if t=
he hardware configuration or bus registration fails during probe.
> - [Low] Comment describes a read followed by a write, but the code implem=
ents a write followed by a read.
> --
>
> commit 1c982ecf71c6fb3b765caf255191a821a5e37cb5
> Author: Aman Kumar Pandey <aman.kumarpandey@nxp.com>
>
> i3c: hub: p3h2x4x: Add support for NXP P3H2x4x I3C hub functionality
>
> Add I3C hub functionality for the NXP P3H2x4x family of multiport hubs.
> These devices support downstream target ports that can be configured
> as I3C, I2C, or SMBus.
>
> > diff --git a/drivers/i3c/hub/p3h2840_i3c_hub_common.c b/drivers/i3c/hub=
/p3h2840_i3c_hub_common.c
> > new file mode 100644
> > index 0000000000000..05e19bff20d5c
> > --- /dev/null
> > +++ b/drivers/i3c/hub/p3h2840_i3c_hub_common.c
> [ ... ]
> > +static void p3h2x4x_get_target_port_dt_conf(struct device *dev,
> > +					    const struct device_node *node)
> > +{
> > +	struct p3h2x4x_i3c_hub_dev *p3h2x4x_i3c_hub =3D dev_get_drvdata(dev);
> > +	u64 tp_port;
> > +
> > +	for_each_available_child_of_node_scoped(node, dev_node) {
> > +		if (of_property_read_reg(dev_node, 0, &tp_port, NULL))
> > +			continue;
> > +
> > +		if (tp_port < P3H2X4X_TP_MAX_COUNT) {
> > +			p3h2x4x_i3c_hub->tp_bus[tp_port].of_node =3D of_node_get(dev_node);
>
> [Severity: Medium]
> Could this leak the of_node reference if a malformed device tree specifies
> multiple child nodes with the same target port index?
>
> If multiple child nodes specify the same reg value, the pointer is
> overwritten with a new of_node_get() result, which abandons the previous
> reference.
>
> > +			p3h2x4x_i3c_hub->tp_bus[tp_port].tp_mask =3D P3H2X4X_SET_BIT(tp_por=
t);
> > +			p3h2x4x_i3c_hub->tp_bus[tp_port].p3h2x4x_i3c_hub =3D p3h2x4x_i3c_hu=
b;
> > +			p3h2x4x_i3c_hub->tp_bus[tp_port].tp_port =3D tp_port;
> > +		}
> > +	}
> > +}
> [ ... ]
> > +static int p3h2x4x_i3c_hub_probe(struct platform_device *pdev)
> > +{
> [ ... ]
> > +	/* Unlock access to protected registers */
> > +	ret =3D regmap_write(p3h2x4x_i3c_hub->regmap, P3H2X4X_DEV_REG_PROTECT=
ION_CODE,
> > +			   P3H2X4X_REGISTERS_UNLOCK_CODE);
> > +	if (ret)
> > +		return dev_err_probe(dev, ret, "Failed to unlock HUB's protected reg=
isters\n");
> > +
> > +	ret =3D p3h2x4x_configure_hw(dev);
> > +	if (ret)
> > +		return dev_err_probe(dev, ret, "Failed to configure the HUB\n");
>
> [Severity: Medium]
> Are the hub's protected registers left permanently unlocked if probe fails
> during p3h2x4x_configure_hw() or bus registration?
>
> The driver unlocks the hardware registers at the start of probe and locks
> them at the very end. However, if any initialization step fails and retur=
ns
> an error, the function exits immediately without locking the registers ag=
ain.
>
> Could this be mitigated by using a devm_add_action_or_reset() callback or
> explicit error handling labels to ensure the registers are safely relocke=
d?

It is not big problem if device can support P3H2X4X_REGISTERS_UNLOCK_CODE
twice without LOCK. The driver should recover from failure state.

>
> > +
> > +	/* Register virtual I3C master controllers for I3C target ports */
> > +	if (p3h2x4x->i3cdev) {
> [ ... ]
> > diff --git a/drivers/i3c/hub/p3h2840_i3c_hub_i3c.c b/drivers/i3c/hub/p3=
h2840_i3c_hub_i3c.c
> > new file mode 100644
> > index 0000000000000..8adb235b992c0
> > --- /dev/null
> > +++ b/drivers/i3c/hub/p3h2840_i3c_hub_i3c.c
> [ ... ]
> > +int p3h2x4x_tp_i3c_algo(struct p3h2x4x_i3c_hub_dev *p3h2x4x_hub)
> > +{
> [ ... ]
> > +	for (tp =3D 0; tp < P3H2X4X_TP_MAX_COUNT; tp++) {
> > +		if (!p3h2x4x_hub->tp_bus[tp].of_node ||
> > +		    p3h2x4x_hub->hub_config.tp_config[tp].mode !=3D P3H2X4X_TP_MODE_=
I3C)
> > +			continue;
> > +
> > +		/* Assign DT node for this TP */
> > +		p3h2x4x_hub->dev->of_node =3D p3h2x4x_hub->tp_bus[tp].of_node;
>
> [Severity: High]
> Does overwriting the parent device's of_node pointer iteratively cause a
> memory leak of the original parent node and a double-free of the target p=
ort
> nodes?

Look like AI is correct.

>
> The loop over target ports directly mutates the shared pdev->dev.of_node
> pointer which was populated in probe using device_set_of_node_from_dev().
> This leaks the reference to the original parent node, and leaves
> dev->of_node pointing to the last target port node.
>
> When the driver is unbound, the driver core will drop a reference on
> dev->of_node, but p3h2x4x_put_target_port_of_nodes() also drops a referen=
ce
> on the same node, which can cause a use-after-free or double-free refcount
> underflow. Mutating dev->of_node also creates a race with sysfs/uevent.
>
> Should the driver assign the node to controller->dev.of_node directly
> instead of mutating the parent's pointer?
>
> > +
> > +		struct i3c_hub_controller *hub_controller =3D
> > +				&p3h2x4x_hub->tp_bus[tp].hub_controller;
> [ ... ]
> > diff --git a/drivers/i3c/hub/p3h2840_i3c_hub_smbus.c b/drivers/i3c/hub/=
p3h2840_i3c_hub_smbus.c
> > new file mode 100644
> > index 0000000000000..cf664425af071
> > --- /dev/null
> > +++ b/drivers/i3c/hub/p3h2840_i3c_hub_smbus.c
> [ ... ]
> > +static int p3h2x4x_read_smbus_transaction_status(struct p3h2x4x_i3c_hu=
b_dev *hub,
> > +						 u8 target_port_status,
> > +						 u8 data_length)
> > +{
> > +	u32 status_read;
> > +	u8 status;
> > +	int ret;
> > +
> > +	fsleep(P3H2X4X_SMBUS_400kHz_TRANSFER_TIMEOUT(data_length));
> > +
> > +	ret =3D regmap_read(hub->regmap, target_port_status, &status_read);
>
> [Severity: High]
> Does using a hardcoded sleep based on bytes transferred instead of pollin=
g a
> hardware completion status bit lead to premature reads of incomplete
> transactions?
>
> If the downstream device performs clock stretching or is slow to respond,
> the transfer will take longer than the hardcoded timeout. The driver then
> reads target_port_status and shifts to check the status bits.
>
> Since an ongoing transaction leaves the status bits at 0
> (P3H2X4X_SMBUS_CNTRL_STATUS_TXN_OK), the driver will incorrectly assume t=
he
> transaction has finished successfully. It will then proceed to read stale=
 or
> uninitialized memory buffers and return garbage data.
>
> Could this be updated to use a polling loop checking the finish flag?

Yes, it should use read_poll_timeout here.

>
> > +	if (ret)
> > +		return ret;
> > +
> > +	status =3D (u8)status_read;
> [ ... ]
> > +static s32 p3h2x4x_tp_i2c_xfer(struct i2c_adapter *adap, struct i2c_ms=
g *msgs, int num)
> > +{
> [ ... ]
> > +		rw =3D (msgs[msg_count].flags & I2C_M_RD) ? 1 : 0;
> > +		if (!rw) {
> > +			/* If a read message is immediately followed by a write message to
> > +			 * the same address,  consider combining them into a single transac=
tion.
> > +			 */
>
> [Severity: Low]
> This isn't a bug, but the comment describes a read followed by a write wh=
ile
> the code implements a write followed by a read.
>
> The actual code block checks !rw for the first message and flags & I2C_M_=
RD
> for the second message, which accurately handles a write message immediat=
ely
> followed by a read message.

small issue, easy to fix it.

Frank

>
> > +			if (msg_count + 1 < num &&
> > +			    msgs[msg_count].addr =3D=3D msgs[msg_count + 1].addr &&
> > +			    (msgs[msg_count + 1].flags & I2C_M_RD)) {
> > +				if (msgs[msg_count].len + msgs[msg_count + 1].len >
> > +				    P3H2X4X_SMBUS_PAYLOAD_SIZE)
> > +					return -EINVAL;
>
> --
> Sashiko AI review =B7 https://sashiko.dev/#/patchset/20260617110355.15918=
44-1-lakshay.piplani@nxp.com?part=3D6

-- =

linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
