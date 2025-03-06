Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60E02C282D1
	for <linux-i3c@archiver.kernel.org>; Thu,  6 Mar 2025 21:09:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zqmIpNFViIYy3XRY0merw870LvCRp69h2aqq+Wfc7Jg=; b=0mUDqYr/vef26H
	p2aynF+5rJJes+asTbCji6LrzPlI/qFOQh1MkmbceQk5Vh9NsT5bwy/phHaUfhZQ4uCrMwxeoVVod
	CmH0K8cF15rmO6LnnJhXWUFruPW2T/L/t5GsD04G0CDIRb7Uuk19+sTHBLHW4Kn1gD78sJYXu9v2j
	nmGaMTiGGR35nmJF8AzSRbbBYr8n57jGFmrua1lAbtXgl1Q11Uo3h+PtKtOsOGjHeuJAcfHMDDHkY
	OBsx3jCMWwEykfRqv0ZkWuhJbj7AWHyRhjjeuTGdDDzJYaIEQcl7+tIO/VX/4OP3ujO9fl3aYPwic
	gysvFe4NRDHlrUkwc0kg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqISp-0000000CDk8-0bb9;
	Thu, 06 Mar 2025 21:09:07 +0000
Received: from mail-db8eur05on20614.outbound.protection.outlook.com ([2a01:111:f403:2614::614] helo=EUR05-DB8-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tqISn-0000000CDix-1Bh0
	for linux-i3c@lists.infradead.org;
	Thu, 06 Mar 2025 21:09:06 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NgzJNUVPLDfEkgi/UkROsJGuondUKDT8NlcBnNMiqnhqojhciIdCW0ac7kUf0eQHeaO1a3/AXN65/uZ4yS5jWuWZI2VmU/cyOcyANXbIxTphevjfoDPMSWD6kTpOlwusciZgFLtlblKe7Z5QWRQPITAGgwTXi7Uo8mtR2ra13pAbw+Vdirhan/EyzejLMDnsZKLQYDD0kNW6RZS6n+S+xShJ0AvZVBqztJMoowoKwdHR+X/+1xWLhwhLQtSNr0bfnFrlIN9yT5hshmlFbXz1jkPWRjqUsyxx3IS8nLltfU+x/gLT3egWszE+cCEUnmk/d1mck85AoPxfKMGKGXUkQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Nrx23cdlKSS9HXDBS/bZOWRLYPl7VW2H+S6a2ENFqes=;
 b=eIfFDrY0zrj2/W9E6iCvpdXs/54SqKMOrN34OLdgbMqswwHEFO3vQxxmazYZQGZsn20ExLvgqk9O3SjzQN1an2tsw0iC08VpYiDpqAWKETMvv4qkWyitEpG6aSgESvdpXLYfsvnsxHWh/jdpedR+g9sRwwU+SDUbJJwOOGSOp3DXMSOgMj0f67/hKeJcVQ6EkYHVF6OyDnHj8qzeIaA+pMLIfDmtrma+0fwIvG5Jk0dQg9UnNrJeOe9IdAPickr6ZmyuV61rlZOYWM9ARu4HCLXN9QPIdDirUJwbTzuz8NxK8ISEPCHyYuVGh/X8lS579t7RSLQWBkasHUscld8L8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Nrx23cdlKSS9HXDBS/bZOWRLYPl7VW2H+S6a2ENFqes=;
 b=e3Y/wTrDU5c/T0WEcI8DQrMla8qm0p77JwUJuns2oQnMLFd9Wt05IS8jNcNfOS5bn1OubLedbLTxUWyQsQR3qD1pSqjYnY0xTBa3IhRX0SH/pbUV6RMFSWM9Akn8aK9bCY6MU+csd4CC9t0TQCLBlMDIWgqT7xm9NeVThrT5RcrxiYdHQRuSx154I/r2ErDpcUSw5tYjfpm7GkMN3Fqoc0QcqyMCgUwEom6nThciyuYXi5Y56IUPVI2soZs88jJRFuFSgHWIM1ZyKeXDQx5gqWUyR8PIvKbCl+ao9DT9HuhZKQpcNMYVAqLswTj1OH6LtgNurjei95O/lsMvE5oKOw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by AM8PR04MB7940.eurprd04.prod.outlook.com (2603:10a6:20b:240::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.19; Thu, 6 Mar
 2025 21:09:02 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%6]) with mapi id 15.20.8511.017; Thu, 6 Mar 2025
 21:09:01 +0000
Date: Thu, 6 Mar 2025 16:08:54 -0500
From: Frank Li <Frank.li@nxp.com>
To: Manjunatha Venkatesh <manjunatha.venkatesh@nxp.com>
Cc: miquel.raynal@bootlin.com, conor.culhane@silvaco.com,
	alexandre.belloni@bootlin.com, linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org, rvmanjumce@gmail.com
Subject: Re: [PATCH v2] svc-i3c-master: Fix read from unreadable memory at
 svc_i3c_master_ibi_work()
Message-ID: <Z8oO5hTx59niiY1U@lizhi-Precision-Tower-5810>
References: <20250306074303.239081-1-manjunatha.venkatesh@nxp.com>
Content-Disposition: inline
In-Reply-To: <20250306074303.239081-1-manjunatha.venkatesh@nxp.com>
X-ClientProxiedBy: SJ0PR13CA0175.namprd13.prod.outlook.com
 (2603:10b6:a03:2c7::30) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|AM8PR04MB7940:EE_
X-MS-Office365-Filtering-Correlation-Id: df452701-4ab8-46ec-abb2-08dd5cf31e7b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|52116014|1800799024|366016|376014|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?K124wJB6tmaSUvLc4IxSy7nWXfaUSdH3rBX+SBo3yFNc83NWZMmhpo3waMM6?=
 =?us-ascii?Q?xupG+dOPsErQI4WZxF1ph+oQEhrpKe/qbcXhmOUeJW6WZRAbnbHXDKfrqFEf?=
 =?us-ascii?Q?XPMhMLA94wYttKi9qIPETnFfMWWo8X+CwX+P/qwlJuPuAiv76NLnN3fhTY7S?=
 =?us-ascii?Q?raZ9F6u9d4nAi8hfqv6Z6IVEuumDQnrHgBVNl3ph7AQ5rslUZekgTgS6+rkQ?=
 =?us-ascii?Q?OyYTbOO24uFC6pjJAhK76HbTJ8TesGwivLWrUCs5PacVKd0ok/Ykwt2/Ile4?=
 =?us-ascii?Q?XwBqOPHRPgrueTj05Aa857ONau6HQ/iOzH6EosCNez3p3wUYYcxOjHz4H+Rb?=
 =?us-ascii?Q?RB3TRyzzhKUezRofmcAP81TQotrmZVagxck2ruWeO6acAVZaH+STXUSnq5Bt?=
 =?us-ascii?Q?d1cugEpmIpEJ56JMWjwzhGlVsKFnyd5XKj22QZv11LWTqDFeUfeLV1iUiXez?=
 =?us-ascii?Q?tlCl1YA95+8w8t9yPkW1bpZ/sULdOpmH2ysFDX2fzXWfJbaVKgvTsLVSOGLz?=
 =?us-ascii?Q?y+tZP/dlB9Qw6XBGsKBFYf74lRE6vnxe/4JOjJBiifFLG/gswPODWM1xD5aE?=
 =?us-ascii?Q?gokKWZHVQK+wXwi/E7XHhlfXM25v5370e5P6I0Cfg1R69pxDridNzkcmkOoz?=
 =?us-ascii?Q?Dc9zTMuc77sL2bVkakKAvQE32zPwaxQiXiC+6uFMOekZB9ZD9po1AOkhc96h?=
 =?us-ascii?Q?FWeLxLe116oHA707vOKv/JERjW4LieymydH6nMbs5xQRlq6hc5oD1rQScw2J?=
 =?us-ascii?Q?G2ZKRHr6LzmlzxacteuyjHDlIoQemlE9Uo0HzYnMd60+uB/T5VqjeFn2HXul?=
 =?us-ascii?Q?zhM7xg/I2Pug2Mt2w4Y+IunnL/kU6jQxuko/XytLXgD3lmtkaCFAq3OZIGyr?=
 =?us-ascii?Q?sp1y/NbH2x/gXJnraSImOISWNFrbFCO9BfarOXcuCU94HDS8mjaXQ2HAEX25?=
 =?us-ascii?Q?ckbkcgxjo4KC9FkSOdZFCyVG8R2hN2+f5yzDG5NJnmKnVTzYLbRGzpjykY9T?=
 =?us-ascii?Q?STnmW71UAWJAOwMHuMdI46udb701EpAJYhF3g5f4zE+rTnUFpZcJC76lKltN?=
 =?us-ascii?Q?hnLeTGtQGNFFmZaVJR3JL7k+PcLT0te48DokwhPnvhhoTJ0GeI3dRwRhplJh?=
 =?us-ascii?Q?FHTzF2yndeKbe0MCr4orfRQow65gIELqSb5kudQC+hCyl0wXVmwSVKSZF1P9?=
 =?us-ascii?Q?fAw1MAn6zUySrDCmlYofizKR7xIOsRemB3p2DvW32cm5a1sk8gYAqPh0AnIq?=
 =?us-ascii?Q?XDuh7HZReoeZ9X6TE2qcLGDgr9jHaX8mAvHHsab6jxRXCkkXh5fVmarZaDNA?=
 =?us-ascii?Q?NpsHGXyWbVZEy9URroiTkPU3EVsy39UN6q9OLBc8JPDOotsILZ0J5/sOLNhg?=
 =?us-ascii?Q?pbG3M8wfLJtNfvT+6fjRFI/8y7aFZGWPoPFk8/ajlt9frVQJ0g=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(1800799024)(366016)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?pKuY6QLdGRxxCLHan4bt+Y+LR/+h3Yy9zcGUvhGmh4X3auPtc4RplrRpB1aF?=
 =?us-ascii?Q?i6b1xPN1nYWiR0U/ubGtgz2YYRLnuH8HFejx+MJpcbUN98JMLeJU/OQQSAkp?=
 =?us-ascii?Q?3F94z1u6nsUMA6ei+LhbltSn8flE9HFTRXjPkqkUGcYR/lpupMfgw1v2oMrA?=
 =?us-ascii?Q?2obs3Loif2cQFkJ47k1FqE3MpJnAE3ileujYgV+i5yDFCMlbtdlPWNeoGsCQ?=
 =?us-ascii?Q?i0il98jnlcDLAyYUWSCuzAz0zHEqA2jEzOwSlBOPkSWKUX5Kv9mTHVTTOxCh?=
 =?us-ascii?Q?8/ibBO5/0s7IY/5JGDIEcJGEOd6WCTiEO2RUbpZ+oByeBsaf5Hp6SZmhWpUY?=
 =?us-ascii?Q?NbCQpGmc1Br9Z16mLdpdJ0uG1nIIf94s+GSU5gO/hBOElsthYMYqxTih/gFp?=
 =?us-ascii?Q?Jg/Nlm0iICtCbl9BOSxAFasdVyKWVGtgtjfStZbgTgkW1IuUuD1FPL9GBgYV?=
 =?us-ascii?Q?BnoiHaWgQ63jd9USOxt7KkeYWSFk7pRSNDMLEK226H9+2mp+HTpUmSBYfxWq?=
 =?us-ascii?Q?45kci1e/hcdhSyttVx2WheP1E78T6qZBp1t4K+3xB4qQGZtweqFJmGuJoYQX?=
 =?us-ascii?Q?867nqw1o8hhjw32rCdx/zXbX6CjoRKhSVAZ+oKGCn/3Yj0x4BwJeJS+10H8X?=
 =?us-ascii?Q?kG78WqJANcQbHf9QYDEjwtaexV5WPZ0fH34n9GeyKDJNOUd78ToIU2QMUysQ?=
 =?us-ascii?Q?47FILpIl3gXT7F7R7I9Lb1qtjOTYUKKOm+zDwhNuMQkzIjUf2TMR8xgZvoJD?=
 =?us-ascii?Q?qDavHQEEYlpCmEFN3xr7HaSQjsEOzlkyrCdZ9J6VSwbcNM/3TRCHowVnhskh?=
 =?us-ascii?Q?j9fwYolx1WZAIipW/3/DEoknXW3XNGBXwc+iazEqMg0M0Pl5EkjbUuB3boV+?=
 =?us-ascii?Q?dKW0/x/gDI1qvjSw27HolVOKuNOHeg4TqiVp7/yc1YzCkVWZRHjSit9ZMNsw?=
 =?us-ascii?Q?dAUuX5GQhqRVm2vTYdiFJihjpqf+DmJpMz6NmVPixPEsazy28CgSyP3cx8Y+?=
 =?us-ascii?Q?7nLaFQudobWSPb+YgLIzi+qp63yX5s+1o00jEnBJ5I5rh6ajjB5SSVCdygKk?=
 =?us-ascii?Q?Edc1QQtC6DeqJsPh55DCfzdSTX9JVhk4b658HMdqanhSvIyCBtDSMOqo5edl?=
 =?us-ascii?Q?Ky2kshX23Gycv3GVpNDkTMeilCGPMIGkIJ2/iCgwuunF1mE73pIdVliBIUgD?=
 =?us-ascii?Q?Pbnt6D1AyCnwx6E/Y6m2G7ry8jp//FaJSaqiCwdCUcDasATzBFErYQSLuULz?=
 =?us-ascii?Q?cCoP+9oUCnsIF5Oc/Dm5AK5FE7+VP+2ki2ncUBgqM8NIluUCVbVxpr7PZXto?=
 =?us-ascii?Q?RLdy42KBpSTYYVG8rPeGmHvEp2yRdwdvbp2vPwKOHm7qy4QN8T8LuqC2eIk+?=
 =?us-ascii?Q?9cL8/WHlDgFE6J2HunvwXUFB29t7IY86TqA5MUgvWIXYdn99zhqhIL5HXf+p?=
 =?us-ascii?Q?gEA5nxlxdXXxgfN2DJ+9Ybs2v5VRWt2FdEvWAsoEiSO74J28Yy2J4vyE9L0B?=
 =?us-ascii?Q?gpuGc7BGnr8qpY+MtjLOATWHOpB1qyh8CMP5EHjNwKCaHLzpFU4n3+twdXQU?=
 =?us-ascii?Q?Y0jtpHzV0b/ZC0Mcb4eSIEdrVGS9qySWayVfiToU?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: df452701-4ab8-46ec-abb2-08dd5cf31e7b
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2025 21:09:01.7708
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NyZ597HLMsj3Rnz5hMKz2H2iLD1C8c6hCvvhi9U8CLQxAmbiNqf4mtteybeJnMgV3GUvwf0bZZoW0Vuqbw4ylQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7940
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250306_130905_337426_5670D2DB 
X-CRM114-Status: GOOD (  17.27  )
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

On Thu, Mar 06, 2025 at 01:13:03PM +0530, Manjunatha Venkatesh wrote:
> As part of I3C driver probing sequence for particular device instance,
> While adding to queue it is trying to access ibi variable of dev which is
> not yet initialized causing "Unable to handle kernel read from unreadable
> memory" resulting in kernel panic.
>
> Signed-off-by: Manjunatha Venkatesh <manjunatha.venkatesh@nxp.com>
> ---

You sent it 3 times.

Do you try my suggestion at v1?
https://lore.kernel.org/linux-i3c/Z8m%2FzE9JvyiNq1HG@lizhi-Precision-Tower-5810/T/#t

Before close above discussion, please not sent new version.

Still missied fix tag and cc stable.

Frank

> Changes since v1:
>   - Patch tittle updated as per the review feedback
>
>  drivers/i3c/master/svc-i3c-master.c | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/i3c/master/svc-i3c-master.c b/drivers/i3c/master/svc-i3c-master.c
> index d6057d8c7dec..98c4d2e5cd8d 100644
> --- a/drivers/i3c/master/svc-i3c-master.c
> +++ b/drivers/i3c/master/svc-i3c-master.c
> @@ -534,8 +534,11 @@ static void svc_i3c_master_ibi_work(struct work_struct *work)
>  	switch (ibitype) {
>  	case SVC_I3C_MSTATUS_IBITYPE_IBI:
>  		if (dev) {
> -			i3c_master_queue_ibi(dev, master->ibi.tbq_slot);
> -			master->ibi.tbq_slot = NULL;
> +			data = i3c_dev_get_master_data(dev);
> +			if (master->ibi.slots[data->ibi]) {
> +				i3c_master_queue_ibi(dev, master->ibi.tbq_slot);
> +				master->ibi.tbq_slot = NULL;
> +			}
>  		}
>  		svc_i3c_master_emit_stop(master);
>  		break;
> --
> 2.46.1
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
