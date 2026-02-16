Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E1E1E81A42
	for <linux-i3c@archiver.kernel.org>; Mon, 16 Feb 2026 16:28:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VqKraBJoYFBK2bMp4RWxd7exTHKDtpBxoApZqZIaP+Y=; b=bdgn/3nlACgzmc
	lV3lKt4c+IhUpJVem9DW4Z04Mf4ltmrjhfI48fAaOCrbxGBqYcrdya97uuuKzYplp32ujH6efaMdT
	3salhOHpcIOvcdbqJtobnWka1i+6s2yGJWfN+ZSYwq+PBHL5MzwO8nWTrfM47asDZrMup6ZF7Qb/Q
	SuwAc3ZgFtomZXs/R+nec+rAWYITXK3cH5GDvKItnVxTg79IEuKPMaxLZWhmMilV44qc3kWloQVUU
	WzAQCSW9pTlsVcDWsQ9RGEshTKK7j7YKR7xbmtwyp4gcMoE433OhhsH6JpyLWRSZCKGyVZSHdTw/Y
	uURoRVYCgZ04wj2UjoNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vs1Sj-000000071zg-0cfC;
	Mon, 16 Feb 2026 16:28:41 +0000
Received: from mail-northeuropeazon11012004.outbound.protection.outlook.com ([52.101.66.4] helo=DUZPR83CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vs1Sf-000000071zH-1YTR
	for linux-i3c@lists.infradead.org;
	Mon, 16 Feb 2026 16:28:38 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UejMfmpKU6cDvvS1VStAocvF0wsRzM0FBA+foI5LUwRimEuyspD8LgiySXQXU5ToDVAMNLUPxcpbepvLGnyfEHepAz00442hB++iBf9818/J9chv3kfpi9tWqP6XvXZEwMuF8Tp3tHEK4leK/chNB5ji9iCfGPH2B9yZE+xhWIqxa+2BHVaipGgKzb+IHAPq/U33JGDnyEoCHQE9lLAKol+o7+l0Rq0Y/+8rq7WV+ui/q8uuil4Xp+tUw2fFQb+hZUMXgeSn79zF2CgIQEx821BEyLySC4EWt5iLwQDSqIYP43mn3ZuSRnRZY3LdQwVEZSozAFfIzaI6csa7Fb08bQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NTNasy8uQoxHHbM4vc1U3QGEdaDBf42MRBvfoexgv5M=;
 b=JZ12cXgVQpOJNFCmoFl59ilHO/6iPcg5aNZhBLzvmSiLZOBjZMqNCDwBiqQfClzx49pFLMXhayyEJ3CKyIl5Qbzl4XigRuompiKkwGWLvvdzZLweOFDhEJe+FvHvajIy2Lgkga6u9SdeCfLlFS7gKAFbFeTxHlJgHbIc1nMH+URzMXdvBvZLrX74uES1ZEEUqFyKzF+AWpzGAI4dDrQAOtcJu3oZ0nQaLP4idfesqM2pD6EcxQ3IfyYxf2BskuGTk0W1FRA2EhyBwBZY3s42hOKGEpmMcB1+9H5zrag34w9oNmZrrJHVIoudgk1hdHv2fyR1/8oNv0Yohdh1dhL8fg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NTNasy8uQoxHHbM4vc1U3QGEdaDBf42MRBvfoexgv5M=;
 b=LcpVYgL0QbuD1BadLN0wtut8NTBYvqloIKD48NQ6oeZCZZj1XzPoGIt5+3SSVBxfHzB1P345MS3yqjh+9jAzG26xCzPt8Gn/2XdoQQwtZ2Mk+O6YVOdthbLhigj+h7qQQTJuzSQy9kQH77PaK/SGQqPPzZ/NgGszxFuZHlHu6t9285pig+TfegVW2UyuXUfxckQAtgYpSO5nKec2v0+lvKndsK66eF5N7N6fR3fq/sEYj9ao6PGvxe+JBQhNhG4pnm96au9Rvhe/ae3QjQ9uQO9NTHiqWuD03nHSSaSboPKJEaSTy3OEiBL7PoLTCZdE9hpblM2a+8aDNVODbZXSqg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by DBAPR04MB7350.eurprd04.prod.outlook.com (2603:10a6:10:1a9::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.13; Mon, 16 Feb
 2026 16:28:33 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9611.013; Mon, 16 Feb 2026
 16:28:33 +0000
Date: Mon, 16 Feb 2026 11:28:28 -0500
From: Frank Li <Frank.li@nxp.com>
To: Randy Dunlap <rdunlap@infradead.org>
Cc: linux-kernel@vger.kernel.org, Miquel Raynal <miquel.raynal@bootlin.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	linux-i3c@lists.infradead.org, imx@lists.linux.dev
Subject: Re: [PATCH] i3c: master: svc: spelling corrections
Message-ID: <aZNFrGBRkDxQvrp3@lizhi-Precision-Tower-5810>
References: <20260216061755.2801697-1-rdunlap@infradead.org>
Content-Disposition: inline
In-Reply-To: <20260216061755.2801697-1-rdunlap@infradead.org>
X-ClientProxiedBy: SA1P222CA0022.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:806:22c::19) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|DBAPR04MB7350:EE_
X-MS-Office365-Filtering-Correlation-Id: fa891bd2-506e-4011-5674-08de6d786d75
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|19092799006|1800799024|366016|376014|52116014|38350700014|7053199007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Kj1M0lDzaidW8a8yRh4z55VBaZL+PrTe6BHlQ+1ac3WBvGA0xrkUtcJO7mnT?=
 =?us-ascii?Q?GjPWGDXXYekrk/5rMejmir5aCxp3dbs5cFp5GVi/U1peGAIJW/OBQgcdutn6?=
 =?us-ascii?Q?ztvS+RHATbVgSCp4+MbhXmSXkCYjYikGsY7S5q18PKjLzHzqcoApPafxRnDY?=
 =?us-ascii?Q?Pc8ubcRGCQjliTqthELGcnWcA+JokN/bO2j56moW/SZYvoVsH12DTOGhFw5A?=
 =?us-ascii?Q?z7LNr39JH7oK2qNHmVq+z4FJzgkzcOlyd1GrvxkKRLIijsDvvpsOn74ChtCy?=
 =?us-ascii?Q?pYsopgb+tuSdSndtYvk/Y6HOVXRq2jBgH7QWrIwy0T9ptO2IL0LQBVYpxIU7?=
 =?us-ascii?Q?DnxsL7x7atLpQ9rtZJKY8qdWztRX/G4QTTLVhGqxK/thsxwLPMJ1fvH1Swwz?=
 =?us-ascii?Q?DRV16+CnpoS5rgyxkj890oOQjLzhXt8+co3fWUtTBHJfgp5P+tVb4ilNZ2Rh?=
 =?us-ascii?Q?j9BP/nv01OEevMD8f8oCX0xBylyruDft8YfRlmusfDjCgvoBEuJxTVQZX3P2?=
 =?us-ascii?Q?u65PoskG6uUWorW8opAqEKwfBiO8ZTpEW7uE+4nCnqNC/Qq8FjAlqgAwW5bj?=
 =?us-ascii?Q?kKBCipVcLbAVzQrDANNCPnwIfFwUwEBWvIY9Eb1viOi6vWEnxqb1aSaQPtcA?=
 =?us-ascii?Q?hfy2ZMrKP2XMUUkU/yrBt3Z4TA7jVybol/1ud5nKRIf+DwSqxlKiBFKwgPeS?=
 =?us-ascii?Q?sl6KnzDPBL9oGmfA0BUvTOW+aRXHrwwIYf8EGWs7rEzR3xeIoNJ+SZaaGQCv?=
 =?us-ascii?Q?LZsHYB+3iELzua2hmvubmacsXTNs3yEBgWyC3NCt4znRH/9TmiTOA07bX633?=
 =?us-ascii?Q?6p8jU//yOEF0UyLW9gUuenvpqBb7fv9pLEtuf6IiMwt4uNieMtZEQvDPe1xT?=
 =?us-ascii?Q?aJViKOmOzyzWkcpO50i5ABERCfcpwz49gmzNODzCdIvSwbOoLuy9r7ExbVYU?=
 =?us-ascii?Q?3OIi2CTkbg24HZL0lEyGMCbFrY6+xtg2uO18evd3MfVnZqGW4UdabA+WlvGd?=
 =?us-ascii?Q?lORBkbxDLjn5C9wlBldMK5jPEnWVGNoB7ngu0U0OzbIIfpxaUT5E0TWjtH1c?=
 =?us-ascii?Q?T5bqyl5cNWFE4Fd96cSXDogznMJz3CxnG8nN/7IT1FxWqZ3w/HqJtD7TTOsW?=
 =?us-ascii?Q?7TfgPAdpzU3mvCOubg0H3QX03+pjO9s2feoyZQ7aGaJeDLR/3IJhBIwhPn2g?=
 =?us-ascii?Q?FppoTpYhT0AK8HUy/UK49nyU4pBr/bsoOAKDYySWXfz0ap8+Yedewq+cYJtV?=
 =?us-ascii?Q?Oa269qAfz2Huj59lf3SKuYGJ06K2aoW6XhkKgnNZUR3Es/wD5lYi8T+UcwGb?=
 =?us-ascii?Q?3oCik3keD+g7W2R2X5+aTGQHyNxBcs11B7ObK1/z3MerqG0QywUiK3yG9s6A?=
 =?us-ascii?Q?Oe7SVy/mJ+rqj463vrLrqKYxi7UYeb9P1TFSAWkJyi+EFK0Uny26ULEiHMJA?=
 =?us-ascii?Q?kT2gy5OqH2W3EnHdfXvJr5bcUGdz6P4kWw5cx93hheZBg9Jvxi1gVIDZWTLG?=
 =?us-ascii?Q?6iDmvrZmJy6tp59F2W+ZAjH+r9PWCChi9NjPZqMOUSJK3dh7sn7FkJSDkkp1?=
 =?us-ascii?Q?Fs66vJg6aMguxNLP0Ww=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(1800799024)(366016)(376014)(52116014)(38350700014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ueUL5ElZ0TWQQqwvLTs1ozaW9AKDUqKh9+Oy6Pm1e9zNPajF1AhKkrFT5DWw?=
 =?us-ascii?Q?BeMu5ZCFNz5IUi6tQdZqw0ard5anZw5HfoZdjj8RgdHEOQsce27OyPmVNT/T?=
 =?us-ascii?Q?3F+1Oz8UBedFLVPAIyubWH3NPeU0MKV1IeYfTbU4B9m4eYLKrvTe0xdCwj6v?=
 =?us-ascii?Q?fJ9+tZOCsmrVn5pkpTgZFMyQrenfoCH4t5+HDP5xxrl/uNu/rstE89EKoYZ+?=
 =?us-ascii?Q?SXWgy4iqHGWLma8zAhlWSWCPm4ydDmFfNkJlQ01vNT+hCcpI+xECcj+YXVvY?=
 =?us-ascii?Q?T1BbG+RwQ6OtoU99OpvLACsF7kAxj43RCO3po6BRbMoDxDOJhl+i+EMo8Zen?=
 =?us-ascii?Q?TNDQT5L6fH/PESQFgI0/SlVKGU5ANjzHngoYajoMo7kadXDndMISZD2aZ2s6?=
 =?us-ascii?Q?Z3h+/+kbEXvcvtb2er4F5PsdBKGf1PoNc40AV56qBj5NAb6CN+L4AMY6HjWw?=
 =?us-ascii?Q?irWZ4oQy+4u/RspV3TcBzsLelj858Y75htU95Xld8deLl4cPRYuSdsOPSubv?=
 =?us-ascii?Q?5ZLN2IWWWIVu0ixueHfi6TZYwtDfbN64yPQQ+RcANY9dN8kgy8gmUGe0s4Tg?=
 =?us-ascii?Q?db3bmGPXksbK5scCdEBEeemBzRJ1n5vavGV9CK09PrhRnQ2P/xW0ks3LpeAp?=
 =?us-ascii?Q?CqUlAe0Jy5pOe0YiQ+TepFD7iy4HaZnzW+jesq/aIAsVEwuyG1j+oAbdfSiI?=
 =?us-ascii?Q?BEQ7ogfFmi3fK60NfteLvWrRe5LL8uhP2Xb1+G0y0Fg1qxB99w+GAIjOV5UA?=
 =?us-ascii?Q?Xh6dCrfTUTPgpa9gMXcroLT2zR02UEqqmnc0QJbgVjFqMiMzAj79cl3lzuvy?=
 =?us-ascii?Q?gCzmqf8HaPJaaCg5aeL91oOqswCHBnVixU9lN3UxRSRHBKB3bB8FPEsgXk/g?=
 =?us-ascii?Q?eyQkpDlW84xyFCeJKkMyCHILZI0JiVADt/pP7YqTvMi/hFWJSefaH8AUJixy?=
 =?us-ascii?Q?HgbcYZILBkCSkzRSTgkict0sarr3PKMRMhF07Qkt5KwRqjdqYyR3eQ/eZm5r?=
 =?us-ascii?Q?NX9H16ohlrJnhlne/hXS3WgruizsMTJ59agT3UdBhdQOXK0LLMfnX6SHsCb4?=
 =?us-ascii?Q?9OPlzGht96Ot1oLzpEdzHBj/5nGShgsLUsZU/+fVulfdHYLaG4IIF8BNgRhW?=
 =?us-ascii?Q?b6oOkinswCWI1kt4ALlFOtExQg2LEgd0qDFG5PDZVidL2P+8wBzYKK0/IqKL?=
 =?us-ascii?Q?2NYJgoG3wzeQUR55t02qzq1PDWTj1Rzygd9tG9AmaV74LSCmV4FRnAe8nOsu?=
 =?us-ascii?Q?TwtVPk2wAEg0dNchiehmrG5TCbFFFeAH7qjoIPHHEWt+3HV/oRaAsxiyOkeQ?=
 =?us-ascii?Q?sjAiCEIi8HNV3tPNypiWjODYu6cHoHxDhBG56OpEVxKXMBCGhyKuAGGdH+UV?=
 =?us-ascii?Q?k8dndbgHBPMi8Rz8iOGbF02l0VRX/9VV+1LAtOQJovASqAKwMSSOqjnndU0P?=
 =?us-ascii?Q?ViFfPJiRceOOfxr/hdQagdN+Io83qo0lshvnv05tZtmRbC2NqJVutuL3bWZu?=
 =?us-ascii?Q?o43eSqQlgJokRkZqOyR2c932ytkj2iNFhwa0neuc7DBxPgVawiu9PaVz8Nt5?=
 =?us-ascii?Q?vks0NzUVC8FqvcCx44lDCJ83cfMfks3vCMsoM0RwyPKeFZsrnJD0m29uhFti?=
 =?us-ascii?Q?XVWY85OXFCFSjuVET3dDSD2aqRXOvAqoeSRPFF5W0cKnbuaoKdbnc5vEnItB?=
 =?us-ascii?Q?SDojXYAYktUNmfYfeBjI/1mjODbAB3xq9Dd4GoV4TZ1hbchg?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fa891bd2-506e-4011-5674-08de6d786d75
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Feb 2026 16:28:33.4825
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AyMFWG8zhBh9ganJF0fsDwkxGH0n5aFXSzhrHTlV42q9AvyApW3/k+O40uGzJcGCcZl0yi8HxJ9IfZ3bTgREmw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR04MB7350
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260216_082837_413307_3A8CB50D 
X-CRM114-Status: GOOD (  14.34  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org

On Sun, Feb 15, 2026 at 10:17:55PM -0800, Randy Dunlap wrote:
> Correct spelling for 3 words as identified by codespell:
>
> svc-i3c-master.c:340: tigger ==> trigger
> svc-i3c-master.c:532: reamins ==> remains
> svc-i3c-master.c:734: filetered ==> filtered
>
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> ---
Reviewed-by: Frank Li <Frank.Li@nxp.com>
> Cc: Miquel Raynal <miquel.raynal@bootlin.com>
> Cc: Frank Li <Frank.Li@nxp.com>
> Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>
> Cc: linux-i3c@lists.infradead.org
> Cc: imx@lists.linux.dev
> ---
>  drivers/i3c/master/svc-i3c-master.c |    6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> --- linux-next-20251210.orig/drivers/i3c/master/svc-i3c-master.c
> +++ linux-next-20251210/drivers/i3c/master/svc-i3c-master.c
> @@ -344,7 +344,7 @@ static void svc_i3c_master_reset_fifo_tr
>  {
>  	u32 reg;
>
> -	/* Set RX and TX tigger levels, flush FIFOs */
> +	/* Set RX and TX trigger levels, flush FIFOs */
>  	reg = SVC_I3C_MDATACTRL_FLUSHTB |
>  	      SVC_I3C_MDATACTRL_FLUSHRB |
>  	      SVC_I3C_MDATACTRL_UNLOCK_TRIG |
> @@ -572,7 +572,7 @@ static void svc_i3c_master_ibi_isr(struc
>  	 * 3. IBI isr writes an AutoIBI request.
>  	 * 4. The controller will not start AutoIBI process because SDA is not low.
>  	 * 5. IBIWON polling times out.
> -	 * 6. Controller reamins in AutoIBI state and doesn't accept EmitStop request.
> +	 * 6. Controller remains in AutoIBI state and doesn't accept EmitStop request.
>  	 */
>  	writel(SVC_I3C_MCTRL_REQUEST_START_ADDR |
>  	       SVC_I3C_MCTRL_TYPE_I3C |
> @@ -774,7 +774,7 @@ static int svc_i3c_master_bus_init(struc
>
>  	/*
>  	 * Using I3C Open-Drain mode, target is 4.17MHz/240ns with a
> -	 * duty-cycle tuned so that high levels are filetered out by
> +	 * duty-cycle tuned so that high levels are filtered out by
>  	 * the 50ns filter (target being 40ns).
>  	 */
>  	odhpp = 1;

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
