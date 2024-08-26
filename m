Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3ADEDC5321D
	for <linux-i3c@archiver.kernel.org>; Mon, 26 Aug 2024 16:05:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YpCd2u+579oyq5VRu2+zrytKE0liJdGzDWws5uEVR+A=; b=XjutkHG/0H+C7b
	a1t22YXCbe7QrG6pi34ApOSJ6vnM8DRINOFILEoqJVBfc7dt5eXajKUPzbCDQ9XruYgI5HvThu9mk
	XldEGITuTGcNlrv1tMdXMglSHwQmb53KN6F7w0LOUasfTnrfD7o7Fm/bkZtZSPRdqHJT6DkJPcpWF
	OvuPAw2aHjlqSSV62GdhhEJDEKY2XJ6VToC925Kz20oc2dKu1XH/hBTGDMIbPraNs35X+TfO8g4ED
	HYEXx17XnQX5Xzk/MoqHIAS4XTeXs9prklTKhfTvFwYMABYRDCCnzySAsWOgn5b/HGXKL65SML4ki
	KRG2vP2/DLyQOI8hyv4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sicDE-00000007vvJ-34pr;
	Mon, 26 Aug 2024 16:05:00 +0000
Received: from mail-vi1eur02on20622.outbound.protection.outlook.com ([2a01:111:f403:2607::622] helo=EUR02-VI1-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sicDB-00000007vuT-30Vv
	for linux-i3c@lists.infradead.org;
	Mon, 26 Aug 2024 16:04:58 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QgwVwuoSX+MvPe+O8clat+rze4OQ45CZHdTyehli6RRonA0X5qF9JFPW1t6toe8vfvzn93M4q7AwkTcIbt96ayy00jaG8zFsCchYbMqEFwHs1zHSO+tyJAJMvqgZK4PnNrP5ZqIfJH7hTu3XDKGMQwUulzT7iZjFar4dBsw9b1lVFAl521d6N9H385c2eRAwYo3lHKrUsfBW0yZxo25Hxx35fuGNXd6DezsZhksrcmN+DbZAkPbVxI4BimLwcGXF62AxJbJ0t+gofiVxXIq7COhQNrVdQjMx4hFUfYWlHIP10Kuju6mRXmgWdW3OHKFttLs64Qeqdcup1lB44lHNOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=n0QEK4/dQp2+zz/THxJeWHKizJDNioG869pz/dh92I8=;
 b=utSISt5TC63ItA4BITZ7+Tkd7gq2+0zzcy2c5FH9PXCfhYO179mE0ATxLQkkN8NkPMSiQRiAq8zkcWMaAhDDmUKvEKWfBJdiJWP9bqOPe2Vi8kM1zZgArJDM5GaK/Bihw+oSo5V+hYojTppVFZUCdvzDc2OegnhFRgqK8agkMfyCKGFYBeUCFIstdbhoFEayi8VJzEhYpor65l5K4TtqyKDj/3TzHj/ODu1EUDr/8a+NWs8XcSP0vjgUHESwi9FPlJ85zGEW3EgbG0mWFR6U78j/OeYKEbM8qWGj8JEnk+Hnf2akjMZpaiHAwIq+C8OMv79Xa2o4F9+8QdXyKznIUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=n0QEK4/dQp2+zz/THxJeWHKizJDNioG869pz/dh92I8=;
 b=REQxrjWFonj/JaEEdbEKoLybCTAoGEy2lfACWbGKhEkFYcYhVifSkmCNdCMrS9FsMAMPCLX+YZKp0fWNq0iYuC/YasxkZDkqkREJ3bV9Ap4UtzNtWFASJ3yBoVajf1EWVDns6voRjF93L3AYeqYm/TFPdcUFLCNI/09QmsTFZ8XnWFBYSizHfKt5rCUPKE7mc4tv9B3nk/FC+q0MfCzIzIwzPRTn8WnT0ufdhzvs1H8MuPRtQyXMOE7b0/iSCL3y4ZncNrgvhZe/s40yM22ktQZkgTyGP2040T7kSccvqn6p5qfsMlCi0wvR3Lhhqd3tcqUz3m0O+C80cDwlQyp+Hg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by AS4PR04MB9691.eurprd04.prod.outlook.com (2603:10a6:20b:4f4::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.24; Mon, 26 Aug
 2024 16:04:51 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%4]) with mapi id 15.20.7875.019; Mon, 26 Aug 2024
 16:04:50 +0000
Date: Mon, 26 Aug 2024 12:04:44 -0400
From: Frank Li <Frank.li@nxp.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: carlos.song@nxp.com, alexandre.belloni@bootlin.com,
	linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org,
	imx@lists.linux.dev, linux-imx@nxp.com
Subject: Re: [PATCH v3] i3c: master: support to adjust first broadcast
 address speed
Message-ID: <ZsynnIWGIlmWPdzW@lizhi-Precision-Tower-5810>
References: <20240826050957.1881563-1-carlos.song@nxp.com>
 <20240826101323.746b617c@xps-13>
Content-Disposition: inline
In-Reply-To: <20240826101323.746b617c@xps-13>
X-ClientProxiedBy: SJ0PR03CA0229.namprd03.prod.outlook.com
 (2603:10b6:a03:39f::24) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|AS4PR04MB9691:EE_
X-MS-Office365-Filtering-Correlation-Id: 492e15a3-db17-4cff-7aad-08dcc5e8d0dc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?r1cLoSoBt2odJnMlMEpPhoIEzEu0TtFD0JpWDWjKW/+LrMWLI+Q6qoxaWm?=
 =?iso-8859-1?Q?ZfipuTTz02l6+lJKlxh9HTczOadwtaudeISF+FSyIPUtp0JhX8jLHFa4IO?=
 =?iso-8859-1?Q?W7y5bs1dYtYs+t9vNTCgXF8RaLYK3hx2FGh18pJig6vM8uWUHZ7HHEFvnM?=
 =?iso-8859-1?Q?lt5q0NyfyCTiaFzhM/bVXRtyxxxHLbAUXQRzm/EcSzgizMhsbW5nhGgpiT?=
 =?iso-8859-1?Q?lOltoCc374PsADG1qStqAf63JWOn5GFpi/ei+6pHy/g6AX1F8skIxC8FsS?=
 =?iso-8859-1?Q?GnkquAbyUpoeJzQwvskegwWt22roRUW81UKsW0wkCDldmYVfN6BU7B44Y9?=
 =?iso-8859-1?Q?wrB2Cmj+UdArrHzN/0x7Pd4BkZJSomBXrsluaE66yaybXfbH0SMimiOFln?=
 =?iso-8859-1?Q?GP1W1F0lkQV8+nDdMA3SKaTJKdd8cHEIF7bQ6ea0OZuM3PmRKngJHdDh72?=
 =?iso-8859-1?Q?8rhnfUnULk+EQSRBC0nfkYcfUGd/edJSDnNVphAVdpTfqJGRdTRCZEc7h2?=
 =?iso-8859-1?Q?TqyP5GkjiAF27kKRy+2UKJ3VW27y/DC9jEIJ3HF6VIPBr8a57p12Vxd/p9?=
 =?iso-8859-1?Q?DhlZfGxGi4XgCYpvY1awJHeJS8dWJu0RBseMpv6qIlKab+Ag0bUMiveAz0?=
 =?iso-8859-1?Q?+5dKFw8B4u0G1vA+nAwD+26LHP/gjZjgDIsM5hCV6YqISmPbGr0jizi34v?=
 =?iso-8859-1?Q?hwV9IZJiG7r2EMX47Ee65SiP3nd5Olug1cKNq9OcGPUiLZJ1WCOHdhSpEB?=
 =?iso-8859-1?Q?Z5Mm6j40oPPHxuT7Iha7gt7iHNmYnBdlBdYblBCSHuLg34BJ0T3ADqd7dH?=
 =?iso-8859-1?Q?QDkUownEJPNVY/TWVAJwLouGo68pIzvhqULj9O9TXnTQBMuW7MOVy1JZ8x?=
 =?iso-8859-1?Q?J6+r2VPvuDG9YUKBrDV5IcicvgDR9AohpGL5zl564MtBaogLN0Du45stvM?=
 =?iso-8859-1?Q?c8XVjdCordYxo/LwFu9T+f4abFco+RkzooL8SlYTzkbyVtsKR8Z+VkalSo?=
 =?iso-8859-1?Q?e01i+4go/LnMcr4k3YJYs3LijcDbya9H07D2Ke7N1VsRaoTzfIbno8rzJh?=
 =?iso-8859-1?Q?b9cqnWlWmbsn0LBldRuzl0Xx7DrigR8lrOiiH3WqHj6QE3UR9kZFb75Lyh?=
 =?iso-8859-1?Q?oMK4wvgsWPwmpNJsqjRo6wFEmcmbjF7pM7UtywV9Ago3ilpKme6Ye5TP1W?=
 =?iso-8859-1?Q?8+C0qgr8RcphSgqb8grDNjW46zzVVlxwng0q9S8p/gXGTscC2CMbyVDS79?=
 =?iso-8859-1?Q?H2fIa4NsjlbYZSm8hxDRv6N47qgPi/YeEImZxLVcAsibqkIKqsRGnnT699?=
 =?iso-8859-1?Q?hyKplsBZx6glb1rkDVFCGlxohKc+DP8r0m4M9Ys47bnJc90JH6QWBVkn+n?=
 =?iso-8859-1?Q?BA6DehHphS4Gna/c+BhEokVmuExMtPmbbe+MskkgpbAY7fRIl5/PVfk3aB?=
 =?iso-8859-1?Q?xKMS6njRtJ760kPU99WnOICV7Hn3lqzHXWLqtQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?7YrPpA1o5lZPZi5pUmYyH+2CNUwOFB4H0Cz3C6S5l62BhCFvFtitHumyxV?=
 =?iso-8859-1?Q?KxUYBUcKlEjCC5arnfcFYP4ey4X23bDI624uqo02AUWRPOnCiEr8u4jSj4?=
 =?iso-8859-1?Q?e8uEZh8cDzxqkDb9Q85G7IkbQCEeAzXTaRT9G0fusRZYzqUpUPqOLkmjbe?=
 =?iso-8859-1?Q?6QusmpKviAqOV5FmIGzAWLK62/Gh3T+pQkH01mI420oSew+xHcTKKEClLu?=
 =?iso-8859-1?Q?LACnkyL35p35tlis7ky5J5zm0vZS74dII7QEs/BkWioi5HAXECyAvNEJki?=
 =?iso-8859-1?Q?h9zMmRm0JeC36+C3idaCBlWO0VX+GDxIqLH0wjRDAJg+ktrh0m+EtVEZoH?=
 =?iso-8859-1?Q?8luJXoEkk6VIrCQWtL7PBHx+OVg0WwZypsRrpdSO9OOVJ24vbWGJfpEwwv?=
 =?iso-8859-1?Q?XCTvQF+5898XiQA358oDeOwtUQkdsHJQctn2x3yPWvIjQw28CHXeUDdczF?=
 =?iso-8859-1?Q?nOzjAEHqUR/pWyKyrbCioGKo7D42BJU1/KhQjLsdPiqOU6J05zzg0iIPbS?=
 =?iso-8859-1?Q?zI3AY6E8wHCbMbiVVyzvjsW5Io3OFq9JJ/RdiBhw8TzV5eGWCRIAlQTaIV?=
 =?iso-8859-1?Q?aOipV+jJJmg5difByKGHOBX1UA18hk7qMp47/trA8zNpCYSMOyJJvHvtGb?=
 =?iso-8859-1?Q?1KTL++Kxg5w/1tCDShGXM2yiI2SUrrRUs2Olf4RZkBK0WR3qZ1A16a8DtE?=
 =?iso-8859-1?Q?SRFDGLUQPdK2EKDKm8pkePl5EdEXUVxaSrERu2tV1ClHx+Vq6Av9OgHZxs?=
 =?iso-8859-1?Q?p9ZdjEAHwCLjYSYOaU8zjnjmQG/lAbsOKuxgAJrXkNjCvd5VzbpG0dJXCC?=
 =?iso-8859-1?Q?Ao64j8fGc2sV55J/7kn1bJ1u1qeiE4fPogBVK+dADUlgDDjqYPrq0xco8v?=
 =?iso-8859-1?Q?yaPYI5hVv+5NOQ7LE+EW/8GZhFMfI+Fv/Goj9h0pH3kOj9W6qypDaJB8B0?=
 =?iso-8859-1?Q?rmp7Dn5fTY4dG/ks6/lDy2GV4nJStEp1NY4g8iasHn+RGoLuLzPQQicRdU?=
 =?iso-8859-1?Q?PPpqGfZ9LxPykih5UL57j1MM6R3JbFdsdouH8BDUcpGWlqGVf+cYZMuAP1?=
 =?iso-8859-1?Q?2fyFY5GMyuRx7FRlTVr0PZT6MnT6aTlGFHrk902du9qBGSdtciahkmkILQ?=
 =?iso-8859-1?Q?R03oeE/g/NSJIFXoWgmdlQZSE63YS2n/XJpWbuoMWBwyTrCNMtS/POU8vQ?=
 =?iso-8859-1?Q?KDuO+2135pRFpES7CzGNTgaHpFZ/aA0PzRKn8LgYagwtP0srCjzN+2yrvV?=
 =?iso-8859-1?Q?ZlmTvz9uI/UFsyr+/Hko5yJ0FKRHgDEfWQkFdnylQ6DLmty3XLnXIiPAND?=
 =?iso-8859-1?Q?12h8WuRzoMrwRjqqIbczeh/ZNJectm/mHLW2jq5tMXoTNrRGWRYWrb8MMD?=
 =?iso-8859-1?Q?Dc9r/Lz830fEHrNDILo52jbmE+whonrihFWyabmuG3E5GwZVAT4OlHjmhr?=
 =?iso-8859-1?Q?zvu/DzSofiz9tlEe0gXAKsZ5ovn0TA6VHTi26wMv3qkjPxjF4lB7K17c37?=
 =?iso-8859-1?Q?KaV/OZFjtX6EUhnLqIDzhk3HvgLN4ilDwXQjBRxA5iAfiCIvBmEDGRaiG3?=
 =?iso-8859-1?Q?iLs72c2VWxVyB2Zx1p2fYrNuQPMYL+BbINqpTKItdA4MBXi9jYPMCxxiar?=
 =?iso-8859-1?Q?A3f8RCL3bYxVLkd8LLfjy5XdB/bgJgoIru?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 492e15a3-db17-4cff-7aad-08dcc5e8d0dc
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2024 16:04:50.8107
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bTc6TCbLnXwSUAL+7fs7XVFnWAe/+WayjbP8cCELiuemVF07Q0FQ2g/VFX61FVloPF2FFjdA0sXoqZb1o0c1hQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR04MB9691
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240826_090457_798822_1442523C 
X-CRM114-Status: GOOD (  11.27  )
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

On Mon, Aug 26, 2024 at 10:13:23AM +0200, Miquel Raynal wrote:
> Hi Carlos,
>
> carlos.song@nxp.com wrote on Mon, 26 Aug 2024 13:09:57 +0800:
>
> > From: Carlos Song <carlos.song@nxp.com>
> >
> > According to I3C spec 6.2 Timing Specification, the Open Drain High Per=
iod
> > of SCL Clock timing for first broadcast address should be adjusted to 2=
00ns
> > at least. I3C device working as i2c device will see the broadcast to cl=
ose
> > its Spike Filter then change to work at I3C mode. After that I3C open d=
rain
> > SCL high level should be adjusted back.
> >
> > Signed-off-by: Carlos Song <carlos.song@nxp.com>
> > Reviewed-by: Frank Li <Frank.Li@nxp.com>
>
> Reviewed-by: Miquel Raynal <miquel.raynal@bootlin.com>
>
> Frank, did you test it with eg. the Silvaco master?

This problem only existed on one board with specific i2c devices. I have
not such boards in hand. Carlos work closely with me and tested by our test
team.

Frank

>
> Thanks,
> Miqu=E8l

-- =

linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
