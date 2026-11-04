Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 410F4608EBA7
	for <linux-i3c@archiver.kernel.org>; Wed,  4 Nov 2026 19:47:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ruPENXxq;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=mf9M7avU
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=Zoqwv1TGN7Tyn9GMNYSy66a11tfO9twH2bEgEKTuWkA=; b=ruPENXxqPPqpzchs5fC+zDFUmx
	Zo6MSgLKDewAystvAseihG1aiH6TfRYKfgHvP2YIxadw/qRqaz86EskfWOFUZX0zYdE0MWYHnE5Ql
	MzWh/p7VaBWq/oSyORt0ZUncuXFMumHamG68tMS7TcUZJxC8TIwMrzNnaJkjKWuINmSd5zoqYs34R
	qib7Ti8oXEE+WCWSRJC6t0haem1DsfMzfx9/uM8Ol2bVzBsaHRrCRZKWS+BS8Vf+wsN+ecByAd0wa
	xFqGWqVuXU8pJhRRcMJfiOSpxd0pEzfv0Cm4OVb5s2q86nk3DXiK+014Obydhl8e9GrtB6cok/MnH
	c7gHkz8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOgxG-00000006ksD-03Du;
	Wed, 04 Nov 2026 19:47:30 +0000
Received: from mail-northeuropeazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c200::3] helo=DU2PR03CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOgxC-00000006kp4-39b5
	for linux-i3c@lists.infradead.org;
	Wed, 04 Nov 2026 19:47:27 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WJjzdiTk9OXs86MbkFo1u0nCUxYAtEMBr/8ileBLCTP7CsWK16TlC9bWpjnvaNzKh9o0Ci89kHND6bFxfGO5k7rXaH16K88mYxrKhe1h1CLwO/AMFobfw65HLDklPPRuMYsUrVkqMxQk/5y7JivezTNtHDml5sbwZ11diBofukT1LXnZEuQexnZ4cgWXP0Omj2wTDXyKCDUJJRAKxW5d6i8E1r5//ti+lF81/DjPR9ZoQoquo0b+wqpb8k+v1JfrlKC4Jhn/dOsn9UqI11GlM/OyEGAIIjR6sq8OYruH0dz6L+LhZ5ZW2qurohjRUzNjxuWHXglG1QzX9av1CPcR0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Rrf+kVmCO0z1UsxrXw/fe80OEQycBZNbliT/WblnX+I=;
 b=Z1fpaJPetfgITAyp4BMXToe1emc628QjpTdSTgo6uiKoYsc6zFhm2U5d7aZGLWOfYBOC1XpcP+CEJ+434rzpH5lQlO5M//V0/VAujGBJfWVEDoW3+ej66j7aFlhtI39xqlcNYi19mBd2O2M5khnGqvVItvKSnyQ8cXCtkEDu9evU2lv1U9BpM8BXZmZ2fvdfIvBidC2j13Fq0xaV5i6c6cJf0ixYhG1k5TMWeVPQxkssgppGOlnNlPQW9MwUyThUH0s5934HjhP30InrC2kkjNihGPK/EXUXwhDRG6vXOGLiq3YCeb7pdv3AdboHAdJKIKyMRTYQjdDpY8QPts4VRQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Rrf+kVmCO0z1UsxrXw/fe80OEQycBZNbliT/WblnX+I=;
 b=mf9M7avUubBq8EaS2nKF3cfcPM2hE3BZvJEchs/3y1fpTDzUJZMq8qaQlps3IXvlamSPSF/vYRfzRnC0dcQWjyi2GmYz4aiLzOre0Y+zr782R0huR5NrLR9mnNrErT+Rl9K1XMURz1bpmTeEQO6n2OOqMSIUvF8CAKo26Dzto/1GYLY0SzoDlHJFMCqqdGrDCTG68KAXubyglTCMM520C08uIePGK9tS1O+DbO4rH/W/HHjxK919rGny2NbWhZiTAwJ7b/XWXGcWRSyHx7FwAYmIbhpjF9fUH83O6AmLFuVAciwz5pHHKr6ufv6i8L/0+uSTyWBdVokqubPzyXLsTA==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com (2603:10a6:290:76::14)
 by GVQPR04MB658120.eurprd04.prod.outlook.com (2603:10a6:710:108::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.10; Wed, 4 Nov
 2026 19:47:22 +0000
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b]) by MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b%6]) with mapi id 15.21.0592.007; Wed, 4 Nov 2026
 19:47:22 +0000
Date: Wed, 4 Nov 2026 14:47:14 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: sashiko-reviews@lists.linux.dev
Cc: Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>,
	linux-i3c@lists.infradead.org, devicetree@vger.kernel.org,
	robh@kernel.org, conor+dt@kernel.org, Frank.Li@kernel.org,
	Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: Re: [PATCH v7 2/3] i3c: master: Add Qualcomm I3C controller driver
Message-ID: <auuLwl3lHwAYPS74@lizhi-Precision-Tower-5810>
References: <20261104122155.3789346-1-mukesh.savaliya@oss.qualcomm.com>
 <20261104122155.3789346-3-mukesh.savaliya@oss.qualcomm.com>
 <sashiko-outbox-197287@kernel.org>
Content-Disposition: inline
In-Reply-To: <sashiko-outbox-197287@kernel.org>
X-ClientProxiedBy: PH7P221CA0058.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:510:33c::28) To MI3PR04MB12438.eurprd04.prod.outlook.com
 (2603:10a6:290:76::14)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MI3PR04MB12438:EE_|GVQPR04MB658120:EE_
X-MS-Office365-Filtering-Correlation-Id: 80a3bbce-2f5f-4bb2-196e-08df3aac7190
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|19092799006|23010399003|376014|1800799024|10067099003|22082099003|18002099003|56012099006|11063799006|4143699003|261026140227099003|261026121527099003|261022105027099003|261028144727099003|261009223027099003;
X-Microsoft-Antispam-Message-Info: xVX1axrJtWghU8bBq/ghBXth06Qw8uCEp8P5z2kgqa87OS111eCHiK46ZcHnhhGuwj5fXPGUGsK16GGWEZ0Lotoz7DRQWagGmJdJ3f5cSwpkgOgxxPzZy/O7GFB19LlHXadS7OgVylF81hjbyyHdf5amGBnZr5pwXGa/WQ7fk+DmyQZC/TL1OZXdRE58/DNbdj3/9ZdjxOfIVOYJW4e1+vapgjhttI+sVgKCsLmip0dtcbGyJntU79oNzDGyOGKtiI3K9k0rNggkS+E7lEww7WMq+Trh+WUm95IdG6h8VA1bnDgzYwsli9ati6eToOzLGkNQCsPgA+YCGkzAxocF2ekcAc+bCyvfqdvg7Ose2+7gPMLRv8ctsFbTOUuX0sdpplpm8H+pa4vxnqOb8iVGphvK3qLAFvI0TMFKfx1M22lPvOYDtgBRjjLAE6vACw7jDtded6GD+Wq+TNTI5CPkOQo4nm/Zctzgd00ZBZTfewKwW/loRPM167M+obbKLio3kDjfWWgOnjRekNq9sDi6qdJxXoIK0nNcnIhHA3QUNWUKuppofmKkrLBwxDLM5oeWvRxlOZVSDOdi4L4jGbWR5MDOtxAUR2jZGYPRhoy6Yw37EgPllJDXQjbAWOiQ4uXK61ac/stm3Dfkm4nrf8P4NaUPy5a2QVBLD1+KA6fihSg=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MI3PR04MB12438.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(19092799006)(23010399003)(376014)(1800799024)(10067099003)(22082099003)(18002099003)(56012099006)(11063799006)(4143699003)(261026140227099003)(261026121527099003)(261022105027099003)(261028144727099003)(261009223027099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?jEFylqyOSaVwN8i1z1oEiPCIBHYOEVemPmZZzFqTYskg6SDjStvpF84RAC6z?=
 =?us-ascii?Q?0vt/PsQIpy+zrsT4TX53j3rTWBY1v2zJTVVdQwUJkmp4evNu+YgEde3iXLQG?=
 =?us-ascii?Q?Q3V1Vdv3sE2gqqlCDInIbhrNOtcWnq3b+vr8I05stD/MH5hJWTKAxpAzH9wg?=
 =?us-ascii?Q?ziPzbXcp0Rce7w8hKM7SI4ldqr2j7Sw+CQlakNxdFq9+iJylM1if12aNwWAe?=
 =?us-ascii?Q?7MJJiLIqja4M6PRDt6Th0w1I0P7PvNLZfS4XFes6yMxkdmejdzFxJ8JwQaHB?=
 =?us-ascii?Q?f+on2VtK+GtyXX1l4iheedlUs01WqjMuLTJE+sZ5E7c67lNn/cBYYmAu4zIL?=
 =?us-ascii?Q?5Z3KOXTQlAfpKE8TC7sj8seIYYJG4GTMBYADjftSa5Uw0F0S3Fi6uc6jnD9m?=
 =?us-ascii?Q?otE+GUFh+BwQtsXcnpcfTo2lhFW/BdNIh04VuhmhNi2+XKvDRv5+hrIKkoWv?=
 =?us-ascii?Q?hV0pABdF438WpqFhUR9GBBeLpe8HNQoKKAEWG+IXRcciypBXCHxwI7/bFXKE?=
 =?us-ascii?Q?KRIXmZV1kGfawdR2gnf4PAGwKGyi80I7XGHJE32UU5VVi080LR8+O+OpHiZh?=
 =?us-ascii?Q?SnDRRlsamtHEnVAUVNBZNTNpZiP4TgEzczci3RATKuAxnPuTaVA8mS2woH6t?=
 =?us-ascii?Q?8zbWygz1QkLx1c7KPlArtu7ftrlcrNFCiw4dI/96Iyq8cjUS3fRRYwLk10PA?=
 =?us-ascii?Q?rRL0Mbx/FB+hd8KUTJAvcXI5JPrNXO9h7dFKk8skmXapKz9ymvC8zME3dTAl?=
 =?us-ascii?Q?Sv7blq/V+flfvo1UiUpBnc2FfIJdnepv2vB/lnvVNLA2hQQFvQ8L+LiaTOOf?=
 =?us-ascii?Q?A+BOYNP7aXkkp/ontotRbKjONQNwrBdP/aU7vXMIYHlcj4KTe93gGI8vl5rG?=
 =?us-ascii?Q?nxFRQnzXKXSsGm3kku3JQBasmOS3CyTVzODnNOS2l/pN/xtd0SepCkhy+KZl?=
 =?us-ascii?Q?VubZX9FJ+HVgeHGFu2z3eKpZC+cW5QN0RONM1Wf1ov+sEJGG8As9U0aWIgSF?=
 =?us-ascii?Q?BBFrSmaLXrpq73zRQOPenZgRSaKrhFDp9vyDL8cp5rGgdq7scy43+w0Qorrg?=
 =?us-ascii?Q?+jrUOfapuSQ2N87/CEBtlVnNeddKvDEwSRz+MLbDvktUuWNsKUQRaqKsS6KK?=
 =?us-ascii?Q?GQwI+9mbvo6rF3qPOSVeW7jUQiEO0FtVMLBgipX32YWu4njbhw8tB+8ZSq0r?=
 =?us-ascii?Q?x94LeuHuPdzvdM8UVkPNd15zTga1Hmrf6SggWp4j2gEWvoBOWCu9RasAcO6d?=
 =?us-ascii?Q?MADo2IJK6OR+CRqBSNYTf8iTJjFIkAaeGInB3JhSwN5iDgbwSOsWF6B/ros9?=
 =?us-ascii?Q?iYgFrvSGB9a6uaMmHrV+f/1RJDhIPFvxBPZT0Kq3QC/C9ik6WR+lhqqFwUR7?=
 =?us-ascii?Q?tEeBHRl8S+f/zeBVgLuJLV0qOjmg+nOmbt/c3fiUo7ZFecDC/SuX7GeL34C0?=
 =?us-ascii?Q?7Zj/rC26mf/fKt2/Z1TzYxSCj4iDt8EqUNrZj6HBrUmhhrEY+0X/AI7sjQbN?=
 =?us-ascii?Q?ytx+sqqyDGYizyELn1DqjsDOusVS9JGc1cVai3tPcxMdwZxi1oAS9L8s8TMA?=
 =?us-ascii?Q?qZ6VD/8fej0u8ulgdXe5pnuNizzWhF5MQL1tUX14yZkCdEHnftHn7Ee0Bce4?=
 =?us-ascii?Q?xNNNYswCeW434+bXCjK19OQIF5Q2wsoNbcfMsPrb6XQsmVlXgdCDbcBT7z4S?=
 =?us-ascii?Q?lszwhB0IXlIs6Oh+vZJFoQBak/YRARB5cIrOD4emncZst2sBaaBe+4jY17oZ?=
 =?us-ascii?Q?4j+Oa43H9LwM3pWJMwytmI+oHOXXJhyQqVIzjVqaJsC4nDHx/bel?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 80a3bbce-2f5f-4bb2-196e-08df3aac7190
X-MS-Exchange-CrossTenant-AuthSource: MI3PR04MB12438.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2026 19:47:22.4647
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +0fvhEh5UHYCoEXFWPR6tO0n7+lXRYVZc4/gfCyuVCBGKdCvzWvRpxGwTiBX/HfkmStCnFo3qRmLinw9X+DqEOzGSw/EnvXjwJu4Gfsve6QtXyIGktHjPBPKaCg47n57
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVQPR04MB658120
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261104_114726_793835_034CF33E 
X-CRM114-Status: UNSURE (   8.80  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: 0.0 (/)
X-BeenThere: linux-i3c@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-i3c.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-i3c/>
List-Post: <mailto:linux-i3c@lists.infradead.org>
List-Help: <mailto:linux-i3c-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-i3c>,
 <mailto:linux-i3c-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Wed, Nov 04, 2026 at 12:43:28PM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 12 potential issue(s) to consider:
> - [Critical] i3c: master: unsafe DMA mapping of i2c_msg in geni_i3c_master_i2c_xfers()
> - [High] i3c: master: clock lookup failure in geni_i3c_clk_map_idx()
> - [High] i3c: master: 6-bit address truncation and DAA bugs in geni_i3c_perform_daa()
> - [High] i3c: master: use_7e is never set in geni_i3c_master_priv_xfers()
> - [High] i3c: master: NACK clobbering and DMA reset bugs in geni_i3c_irq()
> - [High] i3c: qcom-geni: missing reinit_completion() and TX_RESET_DONE in DMA xfer
> - [High] i3c: qcom-geni: broken short read and RX_LAST handling in geni_i3c_irq()
> - [High] i3c: qcom-geni: unclocked register access and disabled IRQ when !CONFIG_PM
> - [High] i3c: qcom-geni: unlocked command start and TX watermark IRQ storm race
> - [Medium] i3c: master: double geni_se_resources_off() on geni_i3c_hw_init() error
> - [Medium] i3c: qcom-geni: unchecked geni_se_resources_off() in runtime suspend
> - [Low] i3c: qcom-geni: unused variable m_stat_mask in geni_i3c_irq()
> --

Please fix these issue before I start review.

Frank

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
