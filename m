Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12D22CA0EF5
	for <linux-i3c@archiver.kernel.org>; Tue, 19 Aug 2025 18:15:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sGwl18ojLZp0ySH20ayu2F7XQ4wVSts7eix2uErGNPs=; b=UdqptSKuKHfuM1
	OTefZu5p9sd8svQU4x//vWMPz1BeL9gPoagoAhsG2TpaKNcEQrZnLCnWP72I16UE+a3x4fGfGTpGi
	wuLrQ90NVM3AWeIQSTx5elq2a0tBKxeUHtMd3icbwybXxB1Kn5Fr92PwEWGsJrmIKjeNxqRkrFxmv
	iNZXBiR5sKC+CpZLxsJokyHhcTvQl8lxR8VxWICaGa5G2Pe0CVwBK4tmCytXNNbG1eMBk68UYmXzO
	5zBta7bid32zVrHSqg4Zn+hE4lzeF+JdYtu/nps4p4rY3CtFRPVkPqdOGFIoxIH2UP63fiNH4z50X
	Toam1kM0GoIPPgq3cB4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoQrj-0000000BF5S-3SOq;
	Tue, 19 Aug 2025 18:15:23 +0000
Received: from mail-swedencentralazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c202::7] helo=GVXPR05CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoNEA-0000000Ajy3-3JrW
	for linux-i3c@lists.infradead.org;
	Tue, 19 Aug 2025 14:22:20 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sxf+hJLU2S83FvodNjbeqUgpXFK4bA81LGGsTrncMrp73c3qVt5drC5LQ0/ZSFEvN4hLQw7jzaFv+UQoGy+ugawWcBlmwEssYl0wFrJYcvdVnlA/CE+6vxYaorRB+RoFaDlYZa+FquDhYUwkrCXGWkagbmnxROsh9xXCdoe6/hz1IK4vgwPCz2bUH5AHqNQbbTBEoAEs7RBDglGAgFiLMLxIqGgp31l2sZvWiGl1BDlXVA+4CIgWdNffbedKAuYpKnNyxe+m652Ke/xnZcv20FJO2uNW/5E474/y9HqWKOJqQiz91e98jfVzat7pYduJ6Il67CHguVFqF1YRHFTNcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=d2O56acV2mdooQalOLqIF2qDtxHMwvvLOtlO/8r/7Sc=;
 b=wo2e2m/fF1Oo2X5BL0MoMh9DncYVPZb2UQMXerEBhJxCDIl5YcpA1TnKq/cpNuTLe7wIpTqskgaiexkvi521dVZNSlx7gvk20J4LkXESXid9FYENIves9q25X3i6h3J7tJQYo4wcXyjt45kyfOSgh46xO0xQgtP4WUG6XKfVazQarPZBCyIzkBaHKWUIeNHPg4+ZYSkqOGFEiZ6qjcxcDSGJeOpXZVRcgLW8py74ZyLiN9HyXxmGPTmfFkEfHfeeDcjjxqSvzesWqqKLgkz5qF/ktPIwfAUgimqFrCCCUAK1jrNw5ng0ULVchSnW7avwV6VwKRXz49q5t4AVT++4gg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d2O56acV2mdooQalOLqIF2qDtxHMwvvLOtlO/8r/7Sc=;
 b=W4UGz5Wcxfhu7zq+Wuf/Ux4bPQegTgM0bvhGwPbaI12C7L6bwIY08b50MKSB5KGB8vLGRrygigWrsDovTN884KrLZZHmCMuIlfrZv+7YbWzZJAe9AP2dT929M+0QSD0P+Ll3huglamJ6Q0+Fg4nhwhlpJeeNNgxd9HQBTarZZjlu/TXvnkeLVyIiKjnDosnVCpIAojJKfb0K5IsIYxTnsI2twxpOuljOHQc5cNWQO2lqr5eURwvEbIaAR56XgFepjac1F3gZ2nh0yxYgTxxTTMxyw5NnkQIWjTnnJexfrNeV7ciEVZwtljd7yDgbgVD3zEjhH88xc5Lou8tNlHQ7TQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by DU4PR04MB11313.eurprd04.prod.outlook.com (2603:10a6:10:5ee::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.12; Tue, 19 Aug
 2025 14:22:09 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%5]) with mapi id 15.20.9052.011; Tue, 19 Aug 2025
 14:22:09 +0000
Date: Tue, 19 Aug 2025 10:22:04 -0400
From: Frank Li <Frank.li@nxp.com>
To: Jarkko Nikula <jarkko.nikula@linux.intel.com>
Cc: linux-i3c@lists.infradead.org,
	Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: Re: [PATCH v2 2/4] i3c: mipi-i3c-hci: Use core helpers for DMA
 mapping and bounce buffering
Message-ID: <aKSIjII5c1SfHH1w@lizhi-Precision-Tower-5810>
References: <20250815141242.2013767-1-jarkko.nikula@linux.intel.com>
 <20250815141242.2013767-3-jarkko.nikula@linux.intel.com>
 <aKNSBaRgLusZE53R@lizhi-Precision-Tower-5810>
 <3e520726-bf64-49a8-bed6-b7c27d3e61fa@linux.intel.com>
Content-Disposition: inline
In-Reply-To: <3e520726-bf64-49a8-bed6-b7c27d3e61fa@linux.intel.com>
X-ClientProxiedBy: PH8P220CA0026.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:510:348::12) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|DU4PR04MB11313:EE_
X-MS-Office365-Filtering-Correlation-Id: b2bf9410-2dee-468a-c05b-08dddf2bc85d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|19092799006|376014|52116014|38350700014|7053199007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Px3xYfdq65py84T4FITJKGz+OGnWKkWv5NB9UI9cAw5nDO7FBhXnrmwvl3Oa?=
 =?us-ascii?Q?rv10CpXBFXQ/YLXljns03aesnUZKO2SHwCFdpKbaUYiJdzroCTjOoH0gWXd4?=
 =?us-ascii?Q?Cygu0rsmzt+PgPtQzTldyZO9XSZBGDZF/b+b5CT2IJQoIs1BHoP1L/FYPUF3?=
 =?us-ascii?Q?PumsLsbm/LXSZHJWxcewhGCEO2ioUF+grWiarAUe1pIWOhoAAbDFsufIS8Bb?=
 =?us-ascii?Q?0dA7q9/HlGePmz8/9ruNJsnnGlbMMfArnnd+egVTaaQJm2KxPZSDBpj5dA2b?=
 =?us-ascii?Q?16EImbMUl7eQU5U4hOvgFHNV7ntiwsP8puXlb5pZznjj9FcLwB9M+r5/s4ud?=
 =?us-ascii?Q?3dSJQ5lJkRxfjcJ1yuZY0yEKM8ijH6YQL2X/EZEfmvn9mdF6quW3IHrC9QXK?=
 =?us-ascii?Q?tKu7RHAiJIRy3Ja5ZQNM7PqRYVmNrA2BSDN6ehstgtiGASqQn1ndqI1gS0Z9?=
 =?us-ascii?Q?m0GsCJu8n7WW6SKHs+vh9VqgBG+QTpx+mZT9cJLHNIU69p8TB8I5o0m2JuNn?=
 =?us-ascii?Q?HYDkZC/a0DaI/0aEVxPK4QdOhFNdaVC9erwGmpmsJKR46xFqh3YjfE+8+7wB?=
 =?us-ascii?Q?hDv+yn5ZQov0iYoo26uS2awfFDxW6l2Wr9bQv6Q/VtM1VxYtT7aHNmTscvsp?=
 =?us-ascii?Q?Q3cA6M7aZyBUB+Nj0/seMEBS/uaMTCQo9/mGn9n4obIFc8cEygwPmVdJGXP1?=
 =?us-ascii?Q?ujyM3oQAs1JEWpXz/TbSdh9RtXOKNbIg5PEWfMe46qjYavyTYwsxI/59+npd?=
 =?us-ascii?Q?oOO/klYrczGMSuJ50tWuWHdveKEtHG1mVLM0G81Rlqn/2hhGtvcH2kBVUof6?=
 =?us-ascii?Q?bcEJfcC+/6tWGbPTlAVAqwcuA9PyiJ9sO48xEdool4Acmqfl8b1m5grPa/Sz?=
 =?us-ascii?Q?whYNvMgpNmgQ7mBmreMVVmTRuiNp0CG7snkre9XWiS2Bvi9fbIlpO3JxzqRb?=
 =?us-ascii?Q?zeYKvsZSKwyHnG6u52M1/vm4NoJr/l30CguUDAcsqVW2FGQExEfBV1QR3T1y?=
 =?us-ascii?Q?ArkmmTIs4rI3qD/raMHVMRS0/IsFNkIBxYVdZhlWwrtSs8zXrAXNvVxjEYbd?=
 =?us-ascii?Q?lTRnqKMZvX6y2h2659LHw3ALamDqbo0C7c0De2YXadZ1tek6AiPj83HlXPCO?=
 =?us-ascii?Q?AsNrHDEPOIgTZjschrUMh23O4zwvkB3BAj9mMTlbjZdBNjCKulS1aldRe0Dv?=
 =?us-ascii?Q?aapziarou58miDffbSTb5yUmghV1CWD+NJzmm17wSOiC9gTxFNBylbQ8XlE8?=
 =?us-ascii?Q?nvv6Dy7+mGASecY5DSZa75WyogElU2hy5Cf3Q384lhfQA4mhH1LZgB/Fq3kd?=
 =?us-ascii?Q?M6nq2dwOeWaqipzH3Pp1ndkJI326QPxc93YeTmK6yJR0uGb9pjOe31M9PzS7?=
 =?us-ascii?Q?Egbe6Mbmken3HNpBfTEE5KliUL4CgtXsPFTOcj9QT4F/92Bex+83VCsFDFQI?=
 =?us-ascii?Q?3fFExKdWrtY=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(19092799006)(376014)(52116014)(38350700014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?KhcfqsrRKImtbVN0l70Vr0Zwsbg7QXsUBaSbEqYAR1w2Rjx0XZu8HwlzIc2n?=
 =?us-ascii?Q?yTfGQfAfTB6PA9Gbi0Nvg3f9Ky26SIkm3bewmT9cNZ0+PfWjBv1IBm9OMHhD?=
 =?us-ascii?Q?U76Xduq08rvySlV2rRYS20z0t53w8Ov1B10VJ92PJSOh3J7t87H46WRc+GXp?=
 =?us-ascii?Q?9pftil2FGLIN0lPlkAeS6MSQg8E5yPYcD7ZhjYDNx0ieC9QgFy7AKBSnAv7Q?=
 =?us-ascii?Q?tjsD6g06Jf0hLRLT9JEnz9CEeIwnGxlL6yB2s9Snbh3Lk4zXVnKNuDVv+fnM?=
 =?us-ascii?Q?4K9ixV8ku9M92hle3c2kmpgSq7Ud96WhPtEgkcgHzH1auIBwdJefWtOfJlzo?=
 =?us-ascii?Q?4hPnNVGCxBJytKsEVBpUgwSOg3TTaFzeku1GKDs90CyQUcHZhkHm3M0RsuAJ?=
 =?us-ascii?Q?4Rr/1pg/TpSQiN+j19cgH4gSdu7/4lpuOyor0suzPNrr2SoYnbypwOjPdGBp?=
 =?us-ascii?Q?Og1USEvR++/ZPRYe/z6VRKTZfL3nPwES9a+EH+P78ve4GS4zbYIGdKRJ3/Ds?=
 =?us-ascii?Q?9grQf4UntiBBN4ROcJVUH3BIWw/Un4y0sFcl4H5/Zl4KfCUSWm4r6QBkaoPV?=
 =?us-ascii?Q?ceC79w+eXW8QQQgccTO0WkKUZoAsKsqGJZuBZa+2nlXt4bOlHU9rmzsglhim?=
 =?us-ascii?Q?LP/bK+jaGC+qEiaupQe9X+YkqnDbtBTy3uHSFw+CuGb6DYkDbvaS4pg8lUff?=
 =?us-ascii?Q?FtF33evIZ5KoEcY7wDIwEEDLfQyqa4yu332Pc5mbA29HMG77tHhgJyNV5F5w?=
 =?us-ascii?Q?qOOcRB/qw2UgDRojF3gHg/doCnFmwseIGPIDaFQ1Rv4gJteDZ7SzLTT1/x6q?=
 =?us-ascii?Q?z0UpstvfBU+rMNJePaSa1W+hJf5R1U2W4rgJDoWistywfPoF0y2MZN9ooySS?=
 =?us-ascii?Q?iMH2CdtlgRzYE/Le81NEs+pxAy9Rk7f6uAq2PrLTcqiZmEdfKlldRIOAG+aY?=
 =?us-ascii?Q?KlUDJlC9Xj3lxP4f71p2EkIDNj/FOuG6PSrTN3hr+BD/RpkMLIGIxhYFTOGs?=
 =?us-ascii?Q?Z8/qfP0yu6XZYOrOfdgtNWp3be+ktGrWnhpz4avMuf8F64jod/CcpNf2QSAh?=
 =?us-ascii?Q?xy/ehpENau//m9ERvTZ/Tx13OTN/xSOIn1Og+anASRHrsMudIH4KsF48vhNX?=
 =?us-ascii?Q?rrVWR+FZj+DXqLLibDekh4et5Mf2bE1tI6OFKfHRRzSfUF53FG46dbwlRxSj?=
 =?us-ascii?Q?Q1kjZOUiUyj7y2tM0jQFAS7yM4byohhQfBqpEeNjk94iJhO8YoikrdSqQeR3?=
 =?us-ascii?Q?z/aawEBtUDJoo/dofcGoM4Bcx7i9tWoNa3dz0WsccngLQW+TQqbA65U7YEQu?=
 =?us-ascii?Q?zZPycRU+CfB2PLBgwPgX/scq+wcViGRKZKKcFgW8eMblOi1DEhrcAPPY6uKh?=
 =?us-ascii?Q?VPXIc/o+w94DmNn7KYrwerO8R16SjsC2sBQJLeLKC08MEnVoMCscDccieGRI?=
 =?us-ascii?Q?zRA3m7dsCQHarprzh/6AjOSePQ9MlJvrGS9mZiSv8cFYpW2wsBoYuhnszIle?=
 =?us-ascii?Q?C/IDelktDI1JYFlVDYXNlHR9raotUxNMRyeGn7xf1WZsvZNWWfUm7A8dkX2F?=
 =?us-ascii?Q?mq4/Q/9MX0/Z98tyeDvQ2Qgghj9T54u+QMeH1GOV?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b2bf9410-2dee-468a-c05b-08dddf2bc85d
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Aug 2025 14:22:09.5783
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ckKNlggygSPy3zWzJNLioc9Cfks/0VmVCq9wBuZWhgYVPjd5FprXOsoeZDuUB+bydzT53eKpyqYUBjDeIuflrQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR04MB11313
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250819_072218_833148_EE82E2F7 
X-CRM114-Status: GOOD (  32.68  )
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

On Tue, Aug 19, 2025 at 09:15:27AM +0300, Jarkko Nikula wrote:
> On 8/18/25 7:17 PM, Frank Li wrote:
> > On Fri, Aug 15, 2025 at 05:12:40PM +0300, Jarkko Nikula wrote:
> > > So far only I3C private and I2C transfers have required a bounce buffer
> > > for DMA transfers when buffer is not DMA'able.
> > >
> > > It was observed that when the device DMA is IOMMU mapped and the receive
> > > length is not a multiple of DWORDs (32-bit), the last DWORD is padded
> > > with stale data from the RX FIFO, corrupting 1-3 bytes beyond the
> > > expected data.
> > >
> > > A similar issue, though less severe, occurs when an I3C target returns
> > > less data than requested. In this case, the padding does not exceed the
> > > requested number of bytes, assuming the device DMA is not IOMMU mapped.
> > >
> > > Therefore, all I3C private transfer, CCC command payload and I2C
> > > transfer receive buffers must be properly sized for the DMA being IOMMU
> > > mapped. Even if those buffers are already DMA safe, their size may not
> > > be DWORD aligned.
> > >
> > > To prepare for the device DMA being IOMMU mapped and to address the
> > > above issue, use helpers from I3C core for DMA mapping and bounce
> > > buffering for all DMA transfers.
> > >
> > > For now, require bounce buffer only when the buffer is in the
> > > vmalloc() area to avoid unnecessary copying with CCC commands and
> > > DMA-safe I2C transfers.
> > >
> > > Signed-off-by: Jarkko Nikula <jarkko.nikula@linux.intel.com>
> > > ---
> > >   drivers/i3c/master/mipi-i3c-hci/core.c | 34 --------------------------
> > >   drivers/i3c/master/mipi-i3c-hci/dma.c  | 32 +++++++++---------------
> > >   drivers/i3c/master/mipi-i3c-hci/hci.h  |  3 +--
> > >   3 files changed, 13 insertions(+), 56 deletions(-)
> > >
> > > diff --git a/drivers/i3c/master/mipi-i3c-hci/core.c b/drivers/i3c/master/mipi-i3c-hci/core.c
> > > index 60f1175f1f37..b2977b6ac9f7 100644
> > > --- a/drivers/i3c/master/mipi-i3c-hci/core.c
> > > +++ b/drivers/i3c/master/mipi-i3c-hci/core.c
> > > @@ -272,34 +272,6 @@ static int i3c_hci_daa(struct i3c_master_controller *m)
> > >   	return hci->cmd->perform_daa(hci);
> > >   }
> > >
> > > -static int i3c_hci_alloc_safe_xfer_buf(struct i3c_hci *hci,
> > > -				       struct hci_xfer *xfer)
> > > -{
> > > -	if (hci->io != &mipi_i3c_hci_dma ||
> > > -	    xfer->data == NULL || !is_vmalloc_addr(xfer->data))
> > > -		return 0;
> > > -
> > > -	if (xfer->rnw)
> > > -		xfer->bounce_buf = kzalloc(xfer->data_len, GFP_KERNEL);
> > > -	else
> > > -		xfer->bounce_buf = kmemdup(xfer->data,
> > > -					   xfer->data_len, GFP_KERNEL);
> > > -
> > > -	return xfer->bounce_buf == NULL ? -ENOMEM : 0;
> > > -}
> > > -
> > > -static void i3c_hci_free_safe_xfer_buf(struct i3c_hci *hci,
> > > -				       struct hci_xfer *xfer)
> > > -{
> > > -	if (hci->io != &mipi_i3c_hci_dma || xfer->bounce_buf == NULL)
> > > -		return;
> > > -
> > > -	if (xfer->rnw)
> > > -		memcpy(xfer->data, xfer->bounce_buf, xfer->data_len);
> > > -
> > > -	kfree(xfer->bounce_buf);
> > > -}
> > > -
> > >   static int i3c_hci_priv_xfers(struct i3c_dev_desc *dev,
> > >   			      struct i3c_priv_xfer *i3c_xfers,
> > >   			      int nxfers)
> > > @@ -333,9 +305,6 @@ static int i3c_hci_priv_xfers(struct i3c_dev_desc *dev,
> > >   		}
> > >   		hci->cmd->prep_i3c_xfer(hci, dev, &xfer[i]);
> > >   		xfer[i].cmd_desc[0] |= CMD_0_ROC;
> > > -		ret = i3c_hci_alloc_safe_xfer_buf(hci, &xfer[i]);
> > > -		if (ret)
> > > -			goto out;
> > >   	}
> > >   	last = i - 1;
> > >   	xfer[last].cmd_desc[0] |= CMD_0_TOC;
> > > @@ -359,9 +328,6 @@ static int i3c_hci_priv_xfers(struct i3c_dev_desc *dev,
> > >   	}
> > >
> > >   out:
> > > -	for (i = 0; i < nxfers; i++)
> > > -		i3c_hci_free_safe_xfer_buf(hci, &xfer[i]);
> > > -
> > >   	hci_free_xfer(xfer, nxfers);
> > >   	return ret;
> > >   }
> > > diff --git a/drivers/i3c/master/mipi-i3c-hci/dma.c b/drivers/i3c/master/mipi-i3c-hci/dma.c
> > > index 491dfe70b660..295671daae09 100644
> > > --- a/drivers/i3c/master/mipi-i3c-hci/dma.c
> > > +++ b/drivers/i3c/master/mipi-i3c-hci/dma.c
> > > @@ -342,16 +342,11 @@ static int hci_dma_init(struct i3c_hci *hci)
> > >   static void hci_dma_unmap_xfer(struct i3c_hci *hci,
> > >   			       struct hci_xfer *xfer_list, unsigned int n)
> > >   {
> > > -	struct hci_xfer *xfer;
> > >   	unsigned int i;
> > >
> > >   	for (i = 0; i < n; i++) {
> > > -		xfer = xfer_list + i;
> > > -		if (!xfer->data)
> > > -			continue;
> > > -		dma_unmap_single(&hci->master.dev,
> > > -				 xfer->data_dma, xfer->data_len,
> > > -				 xfer->rnw ? DMA_FROM_DEVICE : DMA_TO_DEVICE);
> > > +		struct hci_xfer *xfer = xfer_list + i;
> > > +		struct i3c_dma *dma_xfer __free(i3c_master_dma_unmap_single) = xfer->dma;
> >
> > same here, directlly call i3c_master_dma_unmap_single();
> >
> Does that then make needless to define DEFINE_FREE() for the
> i3c_master_dma_unmap_single() in the patch 1/4 since then there won't be
> user for it?

mipi may not use it because build in dma. If use dma engine, it will be
useful.

__free() dma = i3c_master_dma_map_single()

if (dmaengine_prep_slave_single(dma...) == NULL)
	return -1;

We can define DEFINE_FREE() later when real use it, but i3c_master_dma_unmap_single()
API design just one argument, so easy to use DEFINE_FREE.

Leave DEFINE_FREE() here also okay.

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
