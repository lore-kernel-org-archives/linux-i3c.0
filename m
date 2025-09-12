Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1672DCAC582
	for <linux-i3c@archiver.kernel.org>; Fri, 12 Sep 2025 14:22:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tPywwKQewHWSpznIGBtUuaaQPczv/Xc257FLf7GWeJU=; b=WDWvnx7xYp32R5
	DshfFoWS4oHTH/1HraV2H6q7mAV3/HbSM37j6GzrSToYvT8TUa4c8p4EnVH3Rlvdt6//TBa9ZlWRR
	iFZo/gkJ5pip29zpDsj4E0+IF7ZTVcr/+9RkKkFTnglMU7Zs9mNsAMcrr+SOJ7JPhpJiTHDwlQFyC
	qNRxWIFU9pia7AkZqbs3Y+JYbnfxRwtlWpJHVY/60eepE/rNuKD5u8JauK+Uh8rcg5lZMGgBX72PT
	4gjZ3ABmM4ERElcZ8HatKEQW7tOrq5WGBPLyOhHdznsBK+B3p0y4HV4xi+wO3thUHhtp/V2KfCb6S
	Bc0OVlqxo4GScL1pEb2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ux4fQ-00000009qXf-3YAH;
	Fri, 12 Sep 2025 14:22:24 +0000
Received: from mail-swedencentralazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c202::7] helo=GVXPR05CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ux4fO-00000009qW1-3VXq
	for linux-i3c@lists.infradead.org;
	Fri, 12 Sep 2025 14:22:24 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jSTYD+QY9U85bGLZzXVuskDNx2BgMZNwN9f72Jjru3Vr8KUwAvKeFomtK2kZNyKph3dGEpjOct/H9xemLWyWiMPHw+giNH7tdq9MSq0n8g0W4lIGGjkfy5TRd0s6HA1bwEcS0pgrm+DQrHabES1cFIBsKDVQ2PoFlxqE86nWFG/GppZVwl5scQ9wvqenc8K9cPUfQeQ3kCH4W/ZLfsqC7wwboG7fED8qhChXzcLWkCEmj/rtPoU2BV3HjtLT/B/Ug8O0/8SBo1uTc5lN53vIPMzo6KW8wQ4KDF2FV0a0Wxf3/rvHTZiicy30fzMAX2EZRPjdLBVYGIwQLcbdgTg2zg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1/ZRe3JMuPwlfJkXoQt18fHIxgHCvxYbs3+kaXGb+j4=;
 b=EA61Ze4DHtbGc8Bhsf+Cn79I4OndEDqUP/jxHVQOWW6OPlLoFy49dcLU0EBv0vXUm4uIJ7KlmVGF7DO1KEWK1SWIapt4hPUvVYB9uVB4HGsPVTnVuHVY0MJ1uS9BH4SfPKCW5lp0UThwFLvfnfQsuGDOPgI8xNHXKjy/0i8WnMR9PlTiJU4aMb9odWXGU131JHQriucIo1Rv8SkcgFG+M58MUHOQv6VBdX4i/MuEWqC+wO3JkhAlgCe3hBksaAi/9NyU3A1sJfLHeB2T496RkUO09paKiMjKvAEcKnnoeHHd6qs4Q1HkzvZtMi+N9zbQb20PU4dRdI4VAxMA/2RqKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1/ZRe3JMuPwlfJkXoQt18fHIxgHCvxYbs3+kaXGb+j4=;
 b=VvE6Pjn0Ewwizp/lk6xUWDArKJ0QZ2ph+SyxqeJx3/0fDrI6tLgnB22/u50v5xska/UExjBNq15ahqgkhkercKTc161rd4YAFkUaKZWUCr9gCnLznLxLFcSfMh3S/pvQHcHJUDwMkbd/kbrG25Jn6z7zmD0UoVSr8FAZ3TUBq70ci+OQYfzhkK6S1h8p6oaf3OKhIpN0frz4rMwIWn5idqAidSo62zW1N1corshG+58UqFHRQt46kGgEzG3sCP/bgod+F4rVklWzrfGgh49QkIqrG3EwZj8W4Pdb/C9TfyWgPX1mCMU9STjmPtnFpitQOFJTRNiBLU6B+pHVw9WTgA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXSPRMB0053.eurprd04.prod.outlook.com (2603:10a6:102:23f::21)
 by GV1PR04MB10990.eurprd04.prod.outlook.com (2603:10a6:150:209::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.22; Fri, 12 Sep
 2025 14:22:13 +0000
Received: from PAXSPRMB0053.eurprd04.prod.outlook.com
 ([fe80::504f:2a06:4579:5f15]) by PAXSPRMB0053.eurprd04.prod.outlook.com
 ([fe80::504f:2a06:4579:5f15%6]) with mapi id 15.20.9115.015; Fri, 12 Sep 2025
 14:22:13 +0000
Date: Fri, 12 Sep 2025 10:22:05 -0400
From: Frank Li <Frank.li@nxp.com>
To: Jarkko Nikula <jarkko.nikula@linux.intel.com>
Cc: linux-i3c@lists.infradead.org,
	Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: Re: [PATCH 1/5] i3c: mipi-i3c-hci: Change interrupt status prints to
 dev_dbg()
Message-ID: <aMQsjbU33Pe2OYq3@lizhi-Precision-Tower-5810>
References: <20250827103009.243771-1-jarkko.nikula@linux.intel.com>
 <20250827103009.243771-2-jarkko.nikula@linux.intel.com>
Content-Disposition: inline
In-Reply-To: <20250827103009.243771-2-jarkko.nikula@linux.intel.com>
X-ClientProxiedBy: PH7P220CA0010.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:510:326::29) To PAXSPRMB0053.eurprd04.prod.outlook.com
 (2603:10a6:102:23f::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXSPRMB0053:EE_|GV1PR04MB10990:EE_
X-MS-Office365-Filtering-Correlation-Id: 11a8cb87-1e96-47f5-75c4-08ddf207c446
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|19092799006|52116014|1800799024|7053199007|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?gT1ZfYc/phJlJtVBnvQQSnXdNmP70oUrqYsn1kMnVATXvLd62PbMGR5bpmwt?=
 =?us-ascii?Q?dPLw8NfmhpOJ7m1FEp4hAEQNOUIz3VmsoIK1Blb6N516twMzG6EcUUhKYeCT?=
 =?us-ascii?Q?rKYze9FaYhr2bMNg9ndySUMTN0kbrrX2h3ry+GOgwQEG/cwBgws5Gv3TkLlz?=
 =?us-ascii?Q?vzhO/JYV071M845v0c6q+OGAiJAj1zpKM2rgSC49hg7A1YB9U4vgl79Zar02?=
 =?us-ascii?Q?b1pxC48S7mELYvAvV5ndr0dCbSSRFvyNcsTkzp7vdHxepT0Z+RaWhK8YESGy?=
 =?us-ascii?Q?kYmMVrlKb9PNePY8nFam50ObP49+QwydhJnQz+eP2nGkGeZaV5K37ycFdDdL?=
 =?us-ascii?Q?2A/boQktJ5ryvJgm3R21F6y+S5StfwD68HwCme1VMk0sYDh5KpXORZL81edN?=
 =?us-ascii?Q?OCjoadJF+Bpb8MnDCee+wxtCeb82OhI9HZdP/+9CVrMyKhFMIfIaL31sTynM?=
 =?us-ascii?Q?p6PTohInaEtJyPmITVHPnSVpYw2w7UWXoCIQdC57QeAfoExXM9P+kvamVuaP?=
 =?us-ascii?Q?VLvfXTz8yuyW3uuCzhOWACHvntk2R6hABwKtL9EX75QCRnt1oSS+nGNetRSl?=
 =?us-ascii?Q?3a5rhhtwhoXr9RAL24BcJqykwJCawLtBv1zfY9xTtd2WMOfPp5ywH3HH+lwx?=
 =?us-ascii?Q?7bWMce32pWA4A1L+SPxpcbrShGkRVtlQCGhoWOo301M8B+0b/v5IHlc01xYc?=
 =?us-ascii?Q?TAv45kuqP1kYH4q1eUIduVtBTMzdeXD79WNDBEWsQxxK3AVOuYf693+Yqw3i?=
 =?us-ascii?Q?wXo0DBQwBkwB+c5Mc0/xEYJx80EH1rG5PZPalUuPGn0/7n86lOs/R7eLFLdn?=
 =?us-ascii?Q?pP6AquhhEb3aOq7RosTwPMpM6OCZH/0rSwpQPnjaayN0b5mz1ej3uZzjLQCp?=
 =?us-ascii?Q?QaF/J9snx/Aom8X02Mo6h2LUspwzJXfUJ+bt2VcAUzX9s69qDTu0N/ipm7im?=
 =?us-ascii?Q?z76MM+V7rhQwsW0ETZnvZ7znZS5ciDfZI4Uc6FWzjYeTIb4ORjlYfmartRs6?=
 =?us-ascii?Q?V+uxFdm8nt14SAOlIsbH2DAYTlo+1U3vOxRw/8Lj6RyjCgYzIglUZvuTDEU6?=
 =?us-ascii?Q?VSEfqVCGDsl/0bbHwo26cSaFxOkGY8vZK0GGe00WMxehlGBoXwB8sDhNLi4E?=
 =?us-ascii?Q?5J8qONgjLq4wbmQEXjWDf9CsQ3BRQnsUwVUSFTqsKsqaJwVcVaT3M8OyVoEu?=
 =?us-ascii?Q?3Ir+6QpUVMe9bTKRpNRtRyxO4jJ6DeuhyAFu942PiYUF+jZ5D9iM2B+1xLms?=
 =?us-ascii?Q?th7oDrb5IPxDtgq6AJ+Hlg8KkPWVUZDjuh/ZuFbLOKGzIqKTusbcf1dUGNgx?=
 =?us-ascii?Q?wMc0JDj/ZNJ/XwiqLCDbjenaV+SVCuIMBW3SwgefrkwmVDfmelP5WEvFiIWA?=
 =?us-ascii?Q?5ASEYiNyv4csyQti+7m60dYfCofApBKF1B1HOBk+RVeDFFDz8eBC8K8is9Fn?=
 =?us-ascii?Q?ve3DEUBVzhbBeZNEZE9CpE82PfV70574pkfRQQz8jcT7G/h7TbKRDmKsAYwn?=
 =?us-ascii?Q?k90qhfjVcAJVY0A=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXSPRMB0053.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(19092799006)(52116014)(1800799024)(7053199007)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?hdcgochFIRHmQvaAWjvACBIv3Q6H0Xkjmd81cf/QSZekve2Fmcvq+WE0KJ+p?=
 =?us-ascii?Q?10R4Ck4f4bisbD1bMDJoUCwEdUFJ3Lp7aSuF3/TSlK8j+F96txfhP3aRvG3+?=
 =?us-ascii?Q?vrB03lygaQk3dDwxSuU2rVb5oQdHaN18MKzkqjqIZzk+72okWIiW1ANYLaI5?=
 =?us-ascii?Q?ZCyLNW3KaTZnqDikiU76VoUKAkHDhtlNSxeCKSiEAse1EHux8rm+zCC/lJf0?=
 =?us-ascii?Q?ZsZI2JAUqifhxcdA9NT5QBhWCx7/rf6DJjOLeTKAyJp+l3hvvPlZXrG6yKAx?=
 =?us-ascii?Q?3bevXQCsAD+wR69Ofz0yPEUFTkDLjg+kMZzIKPf+IS0F2LHnZAMb66Bn+dEV?=
 =?us-ascii?Q?JHcL17BBPd+JxUza//ZizV6cc4aEOlAqj0C9vK6Ft0jKeNOH8Kchywbt1RvX?=
 =?us-ascii?Q?rexYPAU8lpKqZdZF0hcSjXt6dkrAxnaYbWBfyi1mxAV8+APQ9q+2Mu7k9wbl?=
 =?us-ascii?Q?brUH2wY0L9LXfvMSR3rjq9oHbhFnABrWEQyKlXcQYJuQAWknxhgFnIgoE1MQ?=
 =?us-ascii?Q?GI+JvB0m7G5uvPsTuCQ/HFs4itV3fpU1fCJBS+inB+A5i6zZut7VLAL6LpVV?=
 =?us-ascii?Q?cCuyTiH1X0cmCe523W8SYLEvf+8tZge0UMumpwAumgoMSwpAkXEgriGP3Tgf?=
 =?us-ascii?Q?ztrn/Ekw2YqwDmPPCi13knCDHobcbKM5jmt8ro/bAR1YqGoXQ0xGAfLA/ux0?=
 =?us-ascii?Q?e0z87DTDJLG5tTHNvWUkAPKEbRcAFle1KDnm/C6656scm5EfEux80ZZNz54A?=
 =?us-ascii?Q?xY1ggB+EfecYzpprB36CkSnltR2BaTjrJhAL/EEy3VkoaZmlClBDgIHBiYNt?=
 =?us-ascii?Q?4fFu34fv2hS8zSkd4iu7QmONIQwbUejOXjzkIZ/bTxkx1Ym9r9krjWCi619N?=
 =?us-ascii?Q?fG5yZNJ+lWJnle+04Zk9/kd0TPf+P5CYctYNRg7co6Fcb/uzEEFZtJTQEQkN?=
 =?us-ascii?Q?k5HKtP7R7UEWMB1MJo0OJuvpcUv1zVux0c1lNhhyDOWEvL1Hkhek9NqzSRIz?=
 =?us-ascii?Q?mESWv3Nwil8Z48LzN9kLOBu9IXjOOx/K5eAVS8BuzjKivy6H4fX9JGdNfQCT?=
 =?us-ascii?Q?wWSofl1UKwmcfe+dJxdcRzYhxT/rTjOo4N0pkgXoEe5QEbO3dvVr6weCwUnQ?=
 =?us-ascii?Q?btQJG5OxxvlUkXh9i//XqchZ5oHQMD5YpapheQGoIqTBQo0/HrhdFBO8diHV?=
 =?us-ascii?Q?+qF3uwtV2F5QXnT+LmNT5Yslugy5gF3Qf4nO1ydeIpcS3UZpnVDDlZGRDeJE?=
 =?us-ascii?Q?ih9lLv509r/dXYNYknzDiCd+TBchS9qrfIDIFDNJj3TEWT8P9VdtYd8+sYxk?=
 =?us-ascii?Q?fn1/sVbCv3qChg0wFB8wZh/ftXxakbY5qnsR1CjC08G64OnB3eoEY7NlDf8O?=
 =?us-ascii?Q?zn/T59TBZHcMTvkVfJwtEx5gyrdUO/Y9LDwsECplkHaOg6WuyhDGZCyg5+hM?=
 =?us-ascii?Q?PLfJNwd3xy6QqoY96fstr0tpIWxa1UsE6HgItdscSNiRVxDPoKb9toTyc9SK?=
 =?us-ascii?Q?OAD4HyZjsDX6M6+55zDjo+QKiwAECU8x8ZZsMTaBbJNZJ9sKUwe66MYksFwP?=
 =?us-ascii?Q?iFIGgVGDJB8ZXNLdC90Z8cYfqQGs6dqGjSHQCXpq?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 11a8cb87-1e96-47f5-75c4-08ddf207c446
X-MS-Exchange-CrossTenant-AuthSource: PAXSPRMB0053.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Sep 2025 14:22:12.9168
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: P7s2HLgELW0qFaM7RizWq4YHbn1pHC3YnKbz1ztdVDs01g+4cCf7ZXZfufVnNTpsquJ+tpi5ul17w3Gkk9yyQQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB10990
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250912_072222_904207_3406E688 
X-CRM114-Status: GOOD (  20.92  )
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

On Wed, Aug 27, 2025 at 01:30:05PM +0300, Jarkko Nikula wrote:
> Change interrupt status prints from local DBG() macro to dev_dbg() in
> order to make it easier to enable them without needing to recompile code
> with DEBUG defined.
>
> While doing so, spell out the status register names as they are in the
> specification to make it easier to differentiate between different
> interrupt status registers.
>
> Since dynamic debug prints can include the line number remove the "(in)"
> and "(out)" markers from the PIO interrupt status prints.
>
> Prefix the ring interrupt status print using "Ring %d" instead of "rh%d"
> to make it uniform across all other prints showing the ring number.
>
> Signed-off-by: Jarkko Nikula <jarkko.nikula@linux.intel.com>

Reviewed-by: Frank Li <Frank.Li@nxp.com>

> ---
>  drivers/i3c/master/mipi-i3c-hci/core.c | 2 +-
>  drivers/i3c/master/mipi-i3c-hci/dma.c  | 3 ++-
>  drivers/i3c/master/mipi-i3c-hci/pio.c  | 7 ++++---
>  3 files changed, 7 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/i3c/master/mipi-i3c-hci/core.c b/drivers/i3c/master/mipi-i3c-hci/core.c
> index 7a467ef65787..d532933ac7ab 100644
> --- a/drivers/i3c/master/mipi-i3c-hci/core.c
> +++ b/drivers/i3c/master/mipi-i3c-hci/core.c
> @@ -553,7 +553,7 @@ static irqreturn_t i3c_hci_irq_handler(int irq, void *dev_id)
>
>  	val = reg_read(INTR_STATUS);
>  	reg_write(INTR_STATUS, val);
> -	DBG("INTR_STATUS = %#x", val);
> +	dev_dbg(&hci->master.dev, "INTR_STATUS %#x", val);
>
>  	if (val)
>  		result = IRQ_HANDLED;
> diff --git a/drivers/i3c/master/mipi-i3c-hci/dma.c b/drivers/i3c/master/mipi-i3c-hci/dma.c
> index 09688ada4912..f5f5ab4db172 100644
> --- a/drivers/i3c/master/mipi-i3c-hci/dma.c
> +++ b/drivers/i3c/master/mipi-i3c-hci/dma.c
> @@ -760,7 +760,8 @@ static bool hci_dma_irq_handler(struct i3c_hci *hci)
>
>  		rh = &rings->headers[i];
>  		status = rh_reg_read(INTR_STATUS);
> -		DBG("rh%d status: %#x", i, status);
> +		dev_dbg(&hci->master.dev, "Ring %d: RH_INTR_STATUS %#x",
> +			i, status);
>  		if (!status)
>  			continue;
>  		rh_reg_write(INTR_STATUS, status);
> diff --git a/drivers/i3c/master/mipi-i3c-hci/pio.c b/drivers/i3c/master/mipi-i3c-hci/pio.c
> index 2fc71e696911..cde883137bc7 100644
> --- a/drivers/i3c/master/mipi-i3c-hci/pio.c
> +++ b/drivers/i3c/master/mipi-i3c-hci/pio.c
> @@ -986,7 +986,8 @@ static bool hci_pio_irq_handler(struct i3c_hci *hci)
>
>  	spin_lock(&pio->lock);
>  	status = pio_reg_read(INTR_STATUS);
> -	DBG("(in) status: %#x/%#x", status, pio->enabled_irqs);
> +	dev_dbg(&hci->master.dev, "PIO_INTR_STATUS %#x/%#x",
> +		status, pio->enabled_irqs);
>  	status &= pio->enabled_irqs | STAT_LATENCY_WARNINGS;
>  	if (!status) {
>  		spin_unlock(&pio->lock);
> @@ -1023,8 +1024,8 @@ static bool hci_pio_irq_handler(struct i3c_hci *hci)
>  			pio->enabled_irqs &= ~STAT_CMD_QUEUE_READY;
>
>  	pio_reg_write(INTR_SIGNAL_ENABLE, pio->enabled_irqs);
> -	DBG("(out) status: %#x/%#x",
> -	    pio_reg_read(INTR_STATUS), pio_reg_read(INTR_SIGNAL_ENABLE));
> +	dev_dbg(&hci->master.dev, "PIO_INTR_STATUS %#x/%#x",
> +		pio_reg_read(INTR_STATUS), pio_reg_read(INTR_SIGNAL_ENABLE));
>  	spin_unlock(&pio->lock);
>  	return true;
>  }
> --
> 2.47.2
>
>
> --
> linux-i3c mailing list
> linux-i3c@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-i3c

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
