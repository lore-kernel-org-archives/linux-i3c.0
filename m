Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2316CA0EE6
	for <linux-i3c@archiver.kernel.org>; Tue, 19 Aug 2025 18:15:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qfXWuoa8y4xxc6glP61Cb5CUtZJ1UXGXxIidTrEGj7Q=; b=GN9B99cFmIqOoF
	vZL3NbZJn68HF55ZLBE6j7F++okygtf7YbtcFFsNfK29TkSupvbltHGQA/5AFVbseS2rJC8PQTsEw
	7rj8zhjAYQ7uLCEzuIRzT33xyioc20l9adX6mwyhdBa4k/n9fIHFYsLUX0yYAiSbpYzA1bGpN0BAd
	hlsZE9NySeWH1X1zFJHl4jHyEuJ2iLkYml5NbbHi9fJqJEf8gmIbeqgMqoGSNzCJRvGA2f59XUlQq
	N9qi5cquHJ/5XkwrzZCHoxjPlMIbaEvbR0F1uyqf6Olyk1Kh8CeEzq8WnktdPsVDtUhvgDymJPjev
	1mLV3t+FrN6NZWsmhhqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoQrj-0000000BF4x-1zIu;
	Tue, 19 Aug 2025 18:15:23 +0000
Received: from mail-northeuropeazlp170100001.outbound.protection.outlook.com ([2a01:111:f403:c200::1] helo=DB3PR0202CU003.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoN70-0000000Aiow-1Fbp
	for linux-i3c@lists.infradead.org;
	Tue, 19 Aug 2025 14:14:55 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=svygndXm2/Bw3Fe8JLSjkzUjr2a9rMpX6+iResteBmewqvrb1yk+k8o8LWtjHbi+ITItZJalEv89eJB4N+TWz6h6KsHYXXf63Zwvn5owLQ99v5zmlCV6HWADGnfS4yz9LXZCbhbkTD0x7Is1wiJtTCYHFKKl2y28Rso8sNP44DYBlyIL6AUtxQk4bXRds+aZ2OArJzSJ1jOCPaIIu6mevlph4UPyJXcnJywbLx86PAB5t/PdSKsPWQFdF+ePG++pP/rX4lLhm6c4k01/yWDr4xgrzmMy6V/U8N9dj3div9euqpnI0VB9RP4qiWC7vYm3cvpXrBpY24Ck/si1nCF7lg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cKr5zlaYz20u/dBdz4cY3NzUej3hF9ODCIcOYoX/Gf8=;
 b=d/kIuqOs0oQrPxgSjH3gL0Y4G9DMDDQF4KYkO+8MmbOWtTeBL+UAKVPm46doJgsIyk/PXFpMyv1vHFSqDN/nHGxmufW7/HE5ERrh7m/n9tsHX7Fa60EMGHol4XqnrryNYBzRo43ue9G8ZP0cRyf+iW6IxfyU3hP4EtwKU+KJ/epeJxZYQ3ezuevODAqXGVZPcABmvXyV8ev3EtPf4rpzG52ERIIhfsYJKZzrkJ0fq6fu4iTw6FwFyo+e6Oj88HpHVVJeRjZ5lGBtXLlg+GlloiiwE3K9e24zPAAK/CrUJa2wTnW43X1zV7hjPAYXk6BORrHbVY5ZPvEHcKZ60PsX7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cKr5zlaYz20u/dBdz4cY3NzUej3hF9ODCIcOYoX/Gf8=;
 b=ZnNJB3MoTss51UUUGDKX47Nkm7TJLy3x/Rp00d2RAbLg3S4FDlIZO0Le/NFojIdfVNPNVeVHP4wRu55cwiXjj0klYwMMpAgorKCeHPEwOI1szSFClsmrLsXE2OgSxALxMR4dQpkrX/OxTBTzqPRJAMOije68ZM/0rBm2IJGesdcBZUoUOJTz0hwtofRqHR4wU7JkcEdcOh7jxACN+UPSqHuptu93gdubjyX3RdSvyOgLW7wVtEmagQjUbe/9g5sfG6tdUYPfOw948sSlQTf/fhgOlZY74Gnhf6xS2iIDS7osah5nOZSy7ohWIorZf/DhwkCw4VgyJ3LtHfDoKVc1Mg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by DB9PR04MB11536.eurprd04.prod.outlook.com (2603:10a6:10:5e1::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.12; Tue, 19 Aug
 2025 14:14:45 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%5]) with mapi id 15.20.9052.011; Tue, 19 Aug 2025
 14:14:45 +0000
Date: Tue, 19 Aug 2025 10:14:39 -0400
From: Frank Li <Frank.li@nxp.com>
To: Jarkko Nikula <jarkko.nikula@linux.intel.com>
Cc: linux-i3c@lists.infradead.org,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	"Prabhakaran, Krishna" <krishna.prabhakaran@intel.com>
Subject: Re: [PATCH v2 3/4] i3c: mipi-i3c-hci: Use physical device pointer
 with DMA API
Message-ID: <aKSGz89WyC/IwELZ@lizhi-Precision-Tower-5810>
References: <20250815141242.2013767-1-jarkko.nikula@linux.intel.com>
 <20250815141242.2013767-4-jarkko.nikula@linux.intel.com>
 <aKNUqY4h9DEAP69o@lizhi-Precision-Tower-5810>
 <30b5a638-a571-4cd6-9779-fc5608cbbeca@linux.intel.com>
Content-Disposition: inline
In-Reply-To: <30b5a638-a571-4cd6-9779-fc5608cbbeca@linux.intel.com>
X-ClientProxiedBy: SJ0PR03CA0006.namprd03.prod.outlook.com
 (2603:10b6:a03:33a::11) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|DB9PR04MB11536:EE_
X-MS-Office365-Filtering-Correlation-Id: b2cfe7e1-ed75-461f-88a8-08dddf2abfc6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|19092799006|1800799024|376014|52116014|38350700014|7053199007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?3cc8M4WjXeu//vgSPmhVG6Y9U9orZkl1Qdg6mP18gz1D+mic3p/r40dDZWkj?=
 =?us-ascii?Q?EYsFJBRexEd3xbboqumyAdvasJLTseo8vla0saYpg3xKq3zNwQBC7P0XrZzK?=
 =?us-ascii?Q?kn/l3l9pz7uwboEHe6LB3UQNDB+T5xlHg/0j4p1VG4rACZwzX+zupdUTf843?=
 =?us-ascii?Q?Qteyv1oQcP3bNtiEGTg58Tk3pe0siM5stDWsx3Ul/raHuC7ZpAn1ekhDtxY5?=
 =?us-ascii?Q?utnmE1eHwQBaNKCK0sPzPSoMN6+QtKL9+eU+3uEz5yuKelahsn94J/xUqpeA?=
 =?us-ascii?Q?PT5iKFgrejMDBEUmOoJvsJ70G7lK764WwsoS4eEooIq71GvrYkwPgOym/Sh6?=
 =?us-ascii?Q?qx74A+1RdHGLpeprX02wlahxZnBKmeMDbFylZ6S/AbmjfOicnh7z1He0tgDN?=
 =?us-ascii?Q?WXl6EqXh3TPGsTdeXrSoRu0Fw4gqu5cEntHS6V405/HjpavYptEJya8gsFNb?=
 =?us-ascii?Q?ExE4xADEG01wv7JXKv1FrbjsXcGxGeBwuJNR7lc52sJ86BdQBHImaiHAj0sg?=
 =?us-ascii?Q?jUI+cEjtU9R0/6oTN70WeZyDw5zxtuKDLnR7kczNfTNR4GDgrKWdihY3vLSC?=
 =?us-ascii?Q?dhlkshTcFVK1y2xvBkU3yH6/exYcfIQ2mIM3qibIcWDNfTGAnrhaxIbhVcCU?=
 =?us-ascii?Q?SawA5nIK+YrhruSZO6+TuJO6+ee2Tc5fDD5zD2bsCqDNDlBEXLeZcnYwx7ra?=
 =?us-ascii?Q?E6WPyCZnBpBNXwazJRhNLqHleYsd75M6G9NDez/Qizv4sW5826PAbarucYAA?=
 =?us-ascii?Q?B6tRTHbe0hoz3DRAu4KCym+GpfWxdnngUEm5S2FQwKTNIo4aWaotGmI1hLwd?=
 =?us-ascii?Q?XbLdPDri+KFdnuuTWY3AhnnKiVWZDmXZFR39z+DgyO+kxW/mh04MV1JrjiKl?=
 =?us-ascii?Q?qkttpXXamAtcVJyzM3nQ0r9R7kJPto3O1s+OvQdKxst8kp+KMRo2VAKU7OwH?=
 =?us-ascii?Q?PTujnQtApzjCG/QpGCpSmQzRu3RmKdkAU3j5CXLvnvEuiBuUNuEfUKiCAw7w?=
 =?us-ascii?Q?POCSAocql3BNQcWMWEdk1DYZNnzCivu3xzedunMDDdJV2jAolfn4gnLZJvSc?=
 =?us-ascii?Q?sbN3lE8S6n3vk57KHaBmB2QnzLjYo4zCOpaTxnRRVFBcjgTgl4A/32W1xqXw?=
 =?us-ascii?Q?DDQXPih49Bt4UQ8ealCyM7Zud9v4LP1tCWz6ddGRcWpmMcz5h6Bw1AWt5f0M?=
 =?us-ascii?Q?RmcsT07Ooemm1bzzdrwlNyvKPl8lpQFOg5a3nC6UKBNECp2VZVK0IGILn8qT?=
 =?us-ascii?Q?iDKDPUZAH/vRodJKnkMW8kAImx9ekfH8ZrWUDOl1yOQpi+GFcqJwaBodzuqH?=
 =?us-ascii?Q?h0xG0yhLBByxRe7tYJfH1CfUaQijDSIVVHdne+B00R8vu09FOS0k6RdzvnuV?=
 =?us-ascii?Q?zSz7EMbJrvMNDKMZHV/WfAdp+lvbRmYI5UakPc2kCwGNhsGbDaAFN5so4OhI?=
 =?us-ascii?Q?FlsGeRYJjYI=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(19092799006)(1800799024)(376014)(52116014)(38350700014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?dLbCdNJtH+ffJPWVOzIQGs9I5TG+a9loedr+C9DbFE3jSrPah5kTbfRBELgO?=
 =?us-ascii?Q?HsJS/fILXAxV7vI1TD0v6B+0hwQQtL3DBMHqCYjCXZR6Ia6+zwcOlCs9f3xA?=
 =?us-ascii?Q?gM1l1IuB3M0FHzJCDAkIqOQiCitvazqYy8qAyAavHED1LK+pxf0PMgWY86h7?=
 =?us-ascii?Q?fGbm4fzhk8jN4D8pE2tilpCmUdroQSG5oyjSHMJjPDdvY1W67vhXlgd/09pe?=
 =?us-ascii?Q?NcFeRl5coBDkAtlwuo3P24eePL/ZWZjUCFrDSSdtFELRhIDyhkKJYVYdx9/z?=
 =?us-ascii?Q?NRI6orOcZdFY9H1tb5bdvsxvVPGjBgJds8nT8ITLwrAq9t5Ug2bRvxPnio9/?=
 =?us-ascii?Q?ZXtbmaS64QIvfPEugObTEVhp1JxXHU+honzE/JmHHEBrPkniRQoVZHYwpqEt?=
 =?us-ascii?Q?31HMj6L//vLf9mgkq7zGTa+4j1UqyReNDhBELIIYSBedpYA10vYZEnEgJv9N?=
 =?us-ascii?Q?81SK/jxazAZVipqKcJ7Vf+G4L73mSaIeYd5KY6/jtUwOsRi0ud+bRiDE8yfN?=
 =?us-ascii?Q?nTaPEqG1FjxWMdYxuQ19ha1OkRzYyNk87STmd71fXXSZgDaFr7yjOutqr3b+?=
 =?us-ascii?Q?eLzEDi/xj9LiI0chckh1NzzHtkeRK3rVX25ISQyFthjoz0V7fAKFiaCizcYR?=
 =?us-ascii?Q?C/HLaABSr8kwIfarGrn7QaKOKp2znSkjtdZyC8b103JngV0Loop++uwYkmd2?=
 =?us-ascii?Q?lGPFakuEmB/ITw2OSou9D695BymnfxulR5Uu76CP3cWaFoyiQBXKmG7DrsA9?=
 =?us-ascii?Q?gm3YPy86A9hKVlxInyib8NZJrQQlojo+ZGZ1/l4YttU0r9oLHoggtW8T3hAf?=
 =?us-ascii?Q?aSqc/UxdHtm0fS1qrS2uiVI+6NqLH8wYnGCBW9ImZZ7roXvXnvi/ix0q/C+L?=
 =?us-ascii?Q?CMdYAkU5p3zGgGRkbjFxR3oGFoyQ4He+DD6QErn9dUzdif17owgxElnY3zTn?=
 =?us-ascii?Q?KExqe4r/41l7zeydIOD41ez8RwJP0Hg5vYAadv3jvzqDm42NrQQ97RYD7K14?=
 =?us-ascii?Q?GErwFLoguxqkCOqHDebB3j2baHdvNjRj381AQWklBWEt1wKR+1ANzyqZhVmB?=
 =?us-ascii?Q?3KoyV2GJUIaPAfMsPOWAfMbetRYYpXLzktvpaVY76lw3dWBFQpowgPxGp1kj?=
 =?us-ascii?Q?+kkrotX1iu4yU79itchl75h42isqW43ZDhGxFob/AtCLi63MTB7yP2CDVguZ?=
 =?us-ascii?Q?44QElClCtnZZQ22Zo0/wfu5bKDlqVyUiSzbe8cWw0cGZZlauLlh5Y4Hc+Xxt?=
 =?us-ascii?Q?sTbhHLysdTvIpJ9IsvzfAZvRZo2t1yPVVntxaZUGYk7/MGWZPWWMLN9pZPfD?=
 =?us-ascii?Q?hi7bjD+T7cJclVHQA4kQr7qpId8OPtGiv44ONvn19b9Qj3sBYhtS07Rc5k5o?=
 =?us-ascii?Q?YYhTR7GsavxNeeUsJz0HTU5I3wlng1iR4d2heHK9gFulbqo1c8icIpNnnmwC?=
 =?us-ascii?Q?DoCYR1H+zNzjzpTgOkjmwTUVbp2tJhCEGmefnYGMwlYrMUL+Ci/1y4tgJsOp?=
 =?us-ascii?Q?952LLEcEMeVSb4rALUznNTwMvVILWRxJTCISnMlIdJLL5ojS0waxFpP1cVwa?=
 =?us-ascii?Q?sKSnjFOP4kAQ08Qp5SwmaxereLjDC81wU5i6/17L?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b2cfe7e1-ed75-461f-88a8-08dddf2abfc6
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Aug 2025 14:14:45.7483
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4PSmBjqzo/M/t1EIHXuEo/htw1ZeW4GKjeHjMKtVXCSz5XfHZ2X8cWU8+O3YpKjoP0iYADDhnHDigLKpKNBjDg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB11536
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250819_071454_490348_0DF046B4 
X-CRM114-Status: GOOD (  30.33  )
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

On Tue, Aug 19, 2025 at 09:27:04AM +0300, Jarkko Nikula wrote:
> On 8/18/25 7:28 PM, Frank Li wrote:
> > On Fri, Aug 15, 2025 at 05:12:41PM +0300, Jarkko Nikula wrote:
> > > DMA transfer faults on Intel hardware when the IOMMU is enabled and
> > > driver initialization will fail when attempting to do the first transfer:
> > >
> > > 	DMAR: DRHD: handling fault status reg 2
> > > 	DMAR: [DMA Read NO_PASID] Request device [00:11.0] fault addr 0x676e3000 [fault reason 0x71] SM: Present bit in first-level paging entry is clear
> > >   	i3c mipi-i3c-hci.0: ring 0: Transfer Aborted
> > > 	mipi-i3c-hci mipi-i3c-hci.0: probe with driver mipi-i3c-hci failed with error -62
> > >
> > > Reason for this is that the IOMMU setup is done for the physical devices
> > > only and not for the virtual I3C Controller device object.
> > >
> > > Therefore use the pointer to a physical device object with the DMA API.
> > >
> > > Due to a data corruption observation when the device DMA is IOMMU
> > > mapped, a properly sized receive bounce buffer is required if transfer
> > > length is not a multiple of DWORDs.
> > >
> > > Reported-by: Prabhakaran, Krishna <krishna.prabhakaran@intel.com>
> > > Signed-off-by: Jarkko Nikula <jarkko.nikula@linux.intel.com>
> > > ---
> > >   drivers/i3c/master/mipi-i3c-hci/dma.c | 46 +++++++++++++++++++--------
> > >   1 file changed, 33 insertions(+), 13 deletions(-)
> > >
> > > diff --git a/drivers/i3c/master/mipi-i3c-hci/dma.c b/drivers/i3c/master/mipi-i3c-hci/dma.c
> > > index 295671daae09..8cea91d4d3bf 100644
> > > --- a/drivers/i3c/master/mipi-i3c-hci/dma.c
> > > +++ b/drivers/i3c/master/mipi-i3c-hci/dma.c
> > > @@ -14,6 +14,7 @@
> > >   #include <linux/errno.h>
> > >   #include <linux/i3c/master.h>
> > >   #include <linux/io.h>
> > > +#include <linux/pci.h>
> > >
> > >   #include "hci.h"
> > >   #include "cmd.h"
> > > @@ -138,6 +139,7 @@ struct hci_rh_data {
> > >   };
> > >
> > >   struct hci_rings_data {
> > > +	struct device *sysdev;
> > >   	unsigned int total;
> > >   	struct hci_rh_data headers[] __counted_by(total);
> > >   };
> > > @@ -165,20 +167,20 @@ static void hci_dma_cleanup(struct i3c_hci *hci)
> > >   		rh_reg_write(IBI_SETUP, 0);
> > >
> > >   		if (rh->xfer)
> > > -			dma_free_coherent(&hci->master.dev,
> > > +			dma_free_coherent(rings->sysdev,
> > >   					  rh->xfer_struct_sz * rh->xfer_entries,
> > >   					  rh->xfer, rh->xfer_dma);
> > >   		if (rh->resp)
> > > -			dma_free_coherent(&hci->master.dev,
> > > +			dma_free_coherent(rings->sysdev,
> > >   					  rh->resp_struct_sz * rh->xfer_entries,
> > >   					  rh->resp, rh->resp_dma);
> > >   		kfree(rh->src_xfers);
> > >   		if (rh->ibi_status)
> > > -			dma_free_coherent(&hci->master.dev,
> > > +			dma_free_coherent(rings->sysdev,
> > >   					  rh->ibi_status_sz * rh->ibi_status_entries,
> > >   					  rh->ibi_status, rh->ibi_status_dma);
> > >   		if (rh->ibi_data_dma)
> > > -			dma_unmap_single(&hci->master.dev, rh->ibi_data_dma,
> > > +			dma_unmap_single(rings->sysdev, rh->ibi_data_dma,
> > >   					 rh->ibi_chunk_sz * rh->ibi_chunks_total,
> > >   					 DMA_FROM_DEVICE);
> > >   		kfree(rh->ibi_data);
> > > @@ -194,11 +196,23 @@ static int hci_dma_init(struct i3c_hci *hci)
> > >   {
> > >   	struct hci_rings_data *rings;
> > >   	struct hci_rh_data *rh;
> > > +	struct device *sysdev;
> > >   	u32 regval;
> > >   	unsigned int i, nr_rings, xfers_sz, resps_sz;
> > >   	unsigned int ibi_status_ring_sz, ibi_data_ring_sz;
> > >   	int ret;
> > >
> > > +	/*
> > > +	 * Set pointer to a physical device that does DMA and has IOMMU setup
> > > +	 * done for it in case of enabled IOMMU and use it with the DMA API.
> > > +	 * Here such device is either
> > > +	 * "mipi-i3c-hci" platform device (OF/ACPI enumeration) parent or
> > > +	 * grandparent (PCI enumeration).
> > > +	 */
> > > +	sysdev = hci->master.dev.parent;
> > > +	if (sysdev->parent && dev_is_pci(sysdev->parent))
> > > +		sysdev = sysdev->parent;
> > > +
> > >   	regval = rhs_reg_read(CONTROL);
> > >   	nr_rings = FIELD_GET(MAX_HEADER_COUNT_CAP, regval);
> > >   	dev_info(&hci->master.dev, "%d DMA rings available\n", nr_rings);
> > > @@ -213,6 +227,7 @@ static int hci_dma_init(struct i3c_hci *hci)
> > >   		return -ENOMEM;
> > >   	hci->io_data = rings;
> > >   	rings->total = nr_rings;
> > > +	rings->sysdev = sysdev;
> > >
> > >   	regval = FIELD_PREP(MAX_HEADER_COUNT, rings->total);
> > >   	rhs_reg_write(CONTROL, regval);
> > > @@ -239,9 +254,9 @@ static int hci_dma_init(struct i3c_hci *hci)
> > >   		xfers_sz = rh->xfer_struct_sz * rh->xfer_entries;
> > >   		resps_sz = rh->resp_struct_sz * rh->xfer_entries;
> > >
> > > -		rh->xfer = dma_alloc_coherent(&hci->master.dev, xfers_sz,
> > > +		rh->xfer = dma_alloc_coherent(rings->sysdev, xfers_sz,
> > >   					      &rh->xfer_dma, GFP_KERNEL);
> > > -		rh->resp = dma_alloc_coherent(&hci->master.dev, resps_sz,
> > > +		rh->resp = dma_alloc_coherent(rings->sysdev, resps_sz,
> > >   					      &rh->resp_dma, GFP_KERNEL);
> > >   		rh->src_xfers =
> > >   			kmalloc_array(rh->xfer_entries, sizeof(*rh->src_xfers),
> > > @@ -295,16 +310,16 @@ static int hci_dma_init(struct i3c_hci *hci)
> > >   		ibi_data_ring_sz = rh->ibi_chunk_sz * rh->ibi_chunks_total;
> > >
> > >   		rh->ibi_status =
> > > -			dma_alloc_coherent(&hci->master.dev, ibi_status_ring_sz,
> > > +			dma_alloc_coherent(rings->sysdev, ibi_status_ring_sz,
> > >   					   &rh->ibi_status_dma, GFP_KERNEL);
> > >   		rh->ibi_data = kmalloc(ibi_data_ring_sz, GFP_KERNEL);
> > >   		ret = -ENOMEM;
> > >   		if (!rh->ibi_status || !rh->ibi_data)
> > >   			goto err_out;
> > >   		rh->ibi_data_dma =
> > > -			dma_map_single(&hci->master.dev, rh->ibi_data,
> > > +			dma_map_single(rings->sysdev, rh->ibi_data,
> > >   				       ibi_data_ring_sz, DMA_FROM_DEVICE);
> > > -		if (dma_mapping_error(&hci->master.dev, rh->ibi_data_dma)) {
> > > +		if (dma_mapping_error(rings->sysdev, rh->ibi_data_dma)) {
> > >   			rh->ibi_data_dma = 0;
> > >   			ret = -ENOMEM;
> > >   			goto err_out;
> > > @@ -369,6 +384,7 @@ static int hci_dma_queue_xfer(struct i3c_hci *hci,
> > >   		u32 *ring_data = rh->xfer + rh->xfer_struct_sz * enqueue_ptr;
> > >   		enum dma_data_direction dir = xfer->rnw ? DMA_FROM_DEVICE :
> > >   							  DMA_TO_DEVICE;
> > > +		bool need_bounce;
> > >
> > >   		/* store cmd descriptor */
> > >   		*ring_data++ = xfer->cmd_desc[0];
> > > @@ -387,10 +403,13 @@ static int hci_dma_queue_xfer(struct i3c_hci *hci,
> > >
> > >   		/* 2nd and 3rd words of Data Buffer Descriptor Structure */
> > >   		if (xfer->data) {
> > > -			xfer->dma = i3c_master_dma_map_single(&hci->master.dev,
> > > +			need_bounce = device_iommu_mapped(rings->sysdev) &&
> > > +				      xfer->rnw &&
> >
> > why only read need bounce? if iommu have not map enough size, still fault
> > for write.
> >
> > such as you try to map IO space [0xffd,0x1000). when hardware try access
> > 0x1000, iommu will capture this type error. Maybe it is hard to meet
> > allocate io space at close end of page, you have not found this problem.
> >
> Yes, only read has been problematic so far on our HW when the device is
> IOMMU mapped and write works fine with or without IOMMU. In my opinnion it's
> better to have another patch if such issue is seen on some other HW.

Okay.

Frank
>
> --
> linux-i3c mailing list
> linux-i3c@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-i3c

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
