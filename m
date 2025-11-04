Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF5B1CCF9E3
	for <linux-i3c@archiver.kernel.org>; Tue,  4 Nov 2025 08:53:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=VwmG6EdAwEABNgTDuHiNW5EH1T/iEe2weaLNVq/fQME=; b=mAjujLlKkB2vee
	mM2Ccj3TZrCbAAK6QobDATa3K1VGPu8uOaE6FAk6HgacOu+ZVJbF1jKXOGdzjR6duqkBlxW+FGcGs
	HC5JQN7oXfLaUZpkNIsyElc8Gce0Fy4NZEQYGxk9U3VwwEy6mvKGxY10/MbFrU6gkz6/y3OLhC4tf
	dOYnFvJ3NVn0exyEKfzV/hFEDInaObunGM2oTGqlKnm/fNinUemgYTOyVhGSUTUKC/80Jb6wZpq2e
	XdXHRRjU9I3p90fWUplK0k44t6PISleCXN7Vvlnk2Xvj4HDc7ljDF1Rv0hQaUtGFaw1KxuGuSkGgI
	HOu53gx+JY260f5mOSJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGCnI-0000000BTN3-2Tpe;
	Tue, 04 Nov 2025 08:53:36 +0000
Received: from mail-northcentralusazon11010070.outbound.protection.outlook.com ([52.101.193.70] helo=CH1PR05CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGCnG-0000000BTMT-2Tjm
	for linux-i3c@lists.infradead.org;
	Tue, 04 Nov 2025 08:53:35 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BOU9jG6eKD7HmOaZHN2kYiB9ELBW3pxJouA1OXfK5PVxrlZcBFS2vteKb07mecjhim029FPt8dwd1bN0zjCKZt2Gb2eAOBmCvH1Aql/QEXOsiSEiYla7S5sGLkHhJh5q9c37H0xSmvtXx/zURSr0G8gi2ofHO58NK33AUL4qhwxmDVnSgKCZ11iG2umioTNhnIBLRjh3nL6IVSm20rKOHfKcYXPcQs6cGUQ8CeUGEtp2hBuBXXWusetqxNWktGaZLq5DRzMOjjU1YreCa1JTBgzG+hphZ+ZWpxGNbYuZQWwzRJ3oN9+Svfx/iffi/8JZXdXKz6OMlzktSLEEutg7sQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MyZPtDF8Ou4iiiSRIg/MY3Wh+L+16eF+htRghRfXjUg=;
 b=R5Q+BgRRBQZ6OAD6E/XjOuSbd+WoeEUjtN8FMb3ts3hNcLkfrPB6uck8jzDZXztBDqI4fKPW4/PJd1/HBUfCIcKaky6w00ZSr6NATXd5aFa6amX23hGOCEmLGFqJJzRuDVcgw4KuszEk3unadDd48wPAC/1MlxtaxCgI2T6e2BR7nEbHyzN8DQb50Qn2vwsOPncY7xPfBujaA/Pn1uHb4v/AkbksGNQpVL7cmGfF+iW+aBxdldKfXp4NMOedVvQ/ig6vYZenm+1op5IlIoPKekocUPzPC/SeZvjMGgpVt8A2v8lXnSvpwPKcEHVvbutllGs3WGrvlXEsXiuIgvUI+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=altera.com; dmarc=pass action=none header.from=altera.com;
 dkim=pass header.d=altera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=altera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MyZPtDF8Ou4iiiSRIg/MY3Wh+L+16eF+htRghRfXjUg=;
 b=q4bVRIHMZ0Fd9ZsdubGsbemtFWg9YDOXYpqAsXjQH5iVtkrGj7oN3jbS5ZlGY705l3aj898aQZgvblT+PgS3Q2Cx3ShKO+jrRbpitkvIt5LN27Fx5uprmM+oOwXHGp48+i70HRbb7Smb87XaiHT6RCU4TDcDJofJkjxct0uxoFgBoMwqX8TsCn5DPyZP4Spsf8Jfl4YqG7eYur0s/RN8JwH93L7R4Tac1oitZbu6Ddk4vmWyufxDj0icPWeCGHCBNCdxBfaXF78Mz345/ai698WdZE9jnO+2oZIxF86r5f8dcS4LxIIxweJHIEc4YmesRvFn/fxu3zAPEEd2NJ+zRA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=altera.com;
Received: from DM8PR03MB6230.namprd03.prod.outlook.com (2603:10b6:8:3c::13) by
 DM6PR03MB5164.namprd03.prod.outlook.com (2603:10b6:5:247::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9275.16; Tue, 4 Nov 2025 08:53:30 +0000
Received: from DM8PR03MB6230.namprd03.prod.outlook.com
 ([fe80::abad:9d80:7a13:9542]) by DM8PR03MB6230.namprd03.prod.outlook.com
 ([fe80::abad:9d80:7a13:9542%3]) with mapi id 15.20.9275.013; Tue, 4 Nov 2025
 08:53:29 +0000
From: adrianhoyin.ng@altera.com
To: alexandre.belloni@bootlin.com,
	Frank.Li@nxp.com,
	wsa+renesas@sang-engineering.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	dinguyen@kernel.org,
	linux-i3c@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: adrianhoyin.ng@altera.com
Subject: [PATCH 0/4] i3c: dw: Add support for Device NACK Retry count
Date: Tue,  4 Nov 2025 16:51:07 +0800
Message-ID: <cover.1762245890.git.adrianhoyin.ng@altera.com>
X-Mailer: git-send-email 2.49.GIT
X-ClientProxiedBy: KUZPR03CA0028.apcprd03.prod.outlook.com
 (2603:1096:d10:24::8) To DM8PR03MB6230.namprd03.prod.outlook.com
 (2603:10b6:8:3c::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM8PR03MB6230:EE_|DM6PR03MB5164:EE_
X-MS-Office365-Filtering-Correlation-Id: a678cb80-0ebf-4bb1-5f55-08de1b7fa016
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|7416014|1800799024|921020;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?xsjP4dgepLTBldSq0X68U7bZnJ3NWbLLQ4VvmdSm4gH92G/wkL8BsaUk4aia?=
 =?us-ascii?Q?xMkIIM4MyE2Cs1ZlF7+LSb2x8BvWQx2ond65TVnSeRP3tWnNiDNS1LhGZOMe?=
 =?us-ascii?Q?WSRTiE+ZFhzJKn3qMlpjVkV5S9qe5MFHfNiKvwABkhpc05Fzp5BA9AYN+Vz7?=
 =?us-ascii?Q?aomMsnIKg1ZkWmH0i6dCbog610oW5Ud/Ts/A6NObIXP0p1J9sv3koldogUDu?=
 =?us-ascii?Q?mMS4gS1EmA712SEtR5ahqECMlm8WkM6l3Z2YERTRY0CNBB86SQzt4ur486/R?=
 =?us-ascii?Q?HkoLPgxDEILYwiGsDlE5V1+aVI9fFyObk5QOblayZ+//2aYRqXSGomS+mCwT?=
 =?us-ascii?Q?cDvmOJ5Pt+Lx93NYxMUycvncA/rnxvKg2jFkos5Sa9E3JBZJOrhN3HlQs2TK?=
 =?us-ascii?Q?YpLhDe9b5xR0P8UQZEsph5erwxEp7or4PYOxCoFUC4YtHRddB8WxCWYq5P4r?=
 =?us-ascii?Q?Zblgfx9+aw44GYr4WxWeL7gmsojdmMxRT/8Wx+u1vQVT7Gy+U6jBhUxPojTQ?=
 =?us-ascii?Q?IXpbWdoiVOCdwmkb+4yTZazrjImyRRsGCh6XSjpY6ur780UPZkBDuJ2q2Jmy?=
 =?us-ascii?Q?aizOra62H9wgBwa2prw63qnQDcMoDPLLU9lf+fwhtV65RM7/kzf1DT+xgfY7?=
 =?us-ascii?Q?KIki1S9e0lm269RrOnPosiFt1dr4zDQ2Xe3pDT8LST0abcgYGxrrs+B0LwRi?=
 =?us-ascii?Q?Ttehb4c1SbLJrEpHPE+qSuWJ1hzc3Z6XfU/p5Uyoj60QXK/k2OdsYeAS6atD?=
 =?us-ascii?Q?QaRzNacrQ5Rb8w2JVzhLPNOuLap8aYBdxPoU8jEUoLUcweFmJ90jlWuJeFy7?=
 =?us-ascii?Q?w/q1v3iWRWQaJBWCrRV4xOBm7wEITNiK/rmk2UWcgW3UBBL2YlFqaZ8j6qkR?=
 =?us-ascii?Q?DPcOkhLIrg8F3Mve/fHl4ldNac8l4gnFLVRGps4VpFkSFLatJCFHUIw1K3YZ?=
 =?us-ascii?Q?Grj8HdQlPE2ZRLd9jhAIwhsIfSAQNl3MjwPJ0aooVr6rB4Hj6vKxPEpi/kij?=
 =?us-ascii?Q?px8iqaWLfsPiBY5AGaapyuRoZ/nIVBBz0vzD+T9AgD5aoSQ1L/XwbRs+v+T4?=
 =?us-ascii?Q?JOC0gduKaof9DL1K/bEWJHWJVo0epH385PU0VQlg0oja6LoFiSU2ZWiK92En?=
 =?us-ascii?Q?+REzRvxQpTxmNd5flExhJmfY8f4i0bGHgvzq/hbvjAXgWpIxsnEvULYblY3J?=
 =?us-ascii?Q?6wHrWn6OgvDWRZmpOC3EgDn2DBpeaTw/2ek1InR+Nj688hCYEbyccdkam9vd?=
 =?us-ascii?Q?1F7jtE0rHUyEPml2pSTq5uM0itRC5Y0qVi1jd5w4z67r3oElw7HaHyPjGrNb?=
 =?us-ascii?Q?IDhwmXY+m04i7AZF7FFyhqHeyhRSGBnf/LJp0UfQspUwC1ee+q7XuNgrhmwQ?=
 =?us-ascii?Q?ufObaG4DCmEX9Zh8Te2ad0kkv5LQjDqlZaU1nteco2lCm8n9UL2yhYXr92i3?=
 =?us-ascii?Q?j15plleDL7oyPTfzbUBolNx60wpJwyeFPVBmzN7qv1KTIJ3465rtN9XmSm3g?=
 =?us-ascii?Q?vRdZ5qeTcFuv92U=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM8PR03MB6230.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?vagHUlzdmTBAClaD7tyur71Hx5L4LZ4IVyNB2fh5rhiBWMBs1sEXL/ocCJ/A?=
 =?us-ascii?Q?kSKiv+fQAFE/eKXPiVSSulJFnX17LIH545nf5kUV+e/CDjUQmS7lCEf3g6lU?=
 =?us-ascii?Q?s8p8qzYDtk4MjdxZEbKyhFjuESjKVWgtF9xKfjLjYqmgV60P7oVbDX1SD4Dk?=
 =?us-ascii?Q?f2VmrUsCuZvCmHHxcDUgZzXn8TsE8Q8CaQC2m8+vR/h6YlV9uBx8YW2e95nY?=
 =?us-ascii?Q?UXbfwPT3b6dev+v8c/qALKVCPS8B5GR5CNueiEG7XqfDNQl0IMUqPS6s5TsP?=
 =?us-ascii?Q?Bfb0RoPUVE2zLifvNI36XhKhCnMlHg1KJBxQ7ExLIW7CqFl/elIGeNjOhqch?=
 =?us-ascii?Q?czHXMVQidq9qcME6yj1IW67qwKnekHYUctKUsQrlVusJ0Af3nupvIxLdedTR?=
 =?us-ascii?Q?Iz7pqjXaefUlRKCHpuabb0H31BmUaSnXDmvBGzbQni4gIRtaNcv5Jerpy8dH?=
 =?us-ascii?Q?iBOp4hhI94qild/LM7ZIUni0oX4RJb3zboWavc85bra9CQtXwOHxEx7Bs7XH?=
 =?us-ascii?Q?+tLPQk3IWAXaSl0Lxbs5OXMUUenc5N+m0iw+uJRo/hHD9q4M2mDinQgZkrF/?=
 =?us-ascii?Q?svqwqp/ZBGwngIxDJatNltOZ6pF94+Z/ZY7FJdKfkny5IhaMAfctKYG0pn6t?=
 =?us-ascii?Q?QI2bjNBJfiCIHHj5JiLPk+r0sF7M/4vkwmKINFCPI172LtU6Jdyn+EnyA5rl?=
 =?us-ascii?Q?btDe0fFf7lyWiK9umKJxn1F8TEa/vUdqZ4cO9PajHiCFlySw0bfuNa2w0Z8Q?=
 =?us-ascii?Q?YmQ5MCFYszArvNAYLwzSWrLa3IsNDp8yB5CIt/yoQYklspifZudu7iLup/2j?=
 =?us-ascii?Q?KwhxZ7Mm9d9cCQfmephm1URFXBMpuHcvK651xfzp8ItYwJQEr6F5j5UkFd2K?=
 =?us-ascii?Q?rt+rwZGAlldMBYdjotTWM/2nQRulT+3Sla84hmXwelrKxsjgUaAtGEro5Poh?=
 =?us-ascii?Q?kCl/dlGm8HrRMxegJtD0CaMLogtk4/O7InR8AWRGCBmXDsF9nlts8YDtWhqU?=
 =?us-ascii?Q?DNKhU1U2nFRTUG/2DmEUwSZU3LzSIvbs15M9BnpJI4d6HjLDgwpvSBdUESXh?=
 =?us-ascii?Q?Cfki/VPjiMCx/3YF1zufZacZteUuhF2uEW50WwKGQLV1hm4bkRYcv8ufX+JN?=
 =?us-ascii?Q?rp9vSvul0yueKcvq6PYGAwrx2vGMreMDpXsWp4V21qBocD/lQ9k4g+b3ILfs?=
 =?us-ascii?Q?QNA/scMx6jZJRGhjlxQYZnKMLjRHLthLzUU2ix+e+0YKNuSES3nwrpMPVlHB?=
 =?us-ascii?Q?Djw7Hx7QSFTqeiEXjXKMCo0SquZH6/nCMShXBq5L8EvUGyjYCzm3lyJR0qo4?=
 =?us-ascii?Q?nxEaRsMLxJbqsp6RLtq1b9PcEY+Z70JKewZqR6CmevbkL6uvZxtl1hGVD2lV?=
 =?us-ascii?Q?qfyXk58PjTM8CnwvrXxi11cWf7ZHIqCDnWqOI9ljaF6TI5cvjuLLlPj6vkrG?=
 =?us-ascii?Q?ixvNvnbc/frmm9Fm0CNYlL4w1TstL3RN8gJDA9Lo5eyERuteE+0Ad5f9VnKv?=
 =?us-ascii?Q?EUpA0v1sWbKC7JTirdL0E0ZOA7DnH8BFeYw8MHxFR8ZLqfOWiLnPrpZhfsFq?=
 =?us-ascii?Q?dK3ThJdwy2BfMxGipvpoqZiI7ciLzeCtRBI5FD6XciGlSSCB87Amj9LS6Fgr?=
 =?us-ascii?Q?0A=3D=3D?=
X-OriginatorOrg: altera.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a678cb80-0ebf-4bb1-5f55-08de1b7fa016
X-MS-Exchange-CrossTenant-AuthSource: DM8PR03MB6230.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2025 08:53:29.7054
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fbd72e03-d4a5-4110-adce-614d51f2077a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zrc75eJHb35zWyH+Yc/564Y/J3FoVYtlrl8rX9Mw/mFaDgx4FLrggkXt/0yKISyjsyaj/TdSQ2IAgm+3mnJrzujT+T3UUbqfvqWyZnr2mBI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB5164
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251104_005334_648015_D0D9737B 
X-CRM114-Status: GOOD (  10.90  )
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

From: Adrian Ng Ho Yin <adrianhoyin.ng@altera.com>

This series adds support for configuring the Device NACK Retry count
in the Synopsys DesignWare I3C master controller and enables the
corresponding property in the Altera Agilex5 device tree.

Some I3C slave devices may temporarily NACK transactions when they are
busy or not ready to respond. To enhance bus reliability, the DesignWare
I3C controller supports a programmable retry mechanism that automatically
reissues NACKed transactions. This series introduces the
snps,dev-nack-retry-cnt device tree property to configure this retry
count. The value is written into the Device Address Table (DAT) entry for
each I3C device, enabling fine-grained control of retry behavior.

This series also fixes an issue where existing DAT entries could be
overwritten when the driver restores device addresses. Update
dw_i3c_master_restore_addrs to preserve existing bits in each
DAT entry when restoring addresses.

Adrian Ng Ho Yin (4):
  dt-bindings: i3c: Add snps,dev-nack-retry-cnt property to Synopsys I3C
    master
  arm64: dts: intel: agilex5: Add snps,dev-nack-retry-cnt property for
    I3C controllers
  i3c: dw: Add support for Device NACK Retry count
  i3c: dw: Preserve DAT entry bits when restoring addresses

 .../bindings/i3c/snps,dw-i3c-master.yaml      |  8 ++++
 .../arm64/boot/dts/intel/socfpga_agilex5.dtsi |  2 +
 drivers/i3c/master/dw-i3c-master.c            | 40 ++++++++++++++++++-
 drivers/i3c/master/dw-i3c-master.h            |  1 +
 4 files changed, 49 insertions(+), 2 deletions(-)

-- 
2.49.GIT


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
