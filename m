Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD3A4CDB474
	for <linux-i3c@archiver.kernel.org>; Mon, 16 Oct 2023 15:32:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=J3V9l9vss5pBBx5xEMNBVvtKOyQnDsyhplO4x1g6lps=; b=wPtBsvuNBAnRoD
	q5p73f9PXBuJcd55sO1HLAojDtWoENuuzrn95NlUuUDHP8j+SLoS7UOUJ41QKx6pzK5fM+3FJoLg+
	o8A7qySqUyj4M7g4qJO/Jo4/atBvoTVjnerXSlP1/mAvSbbLDivZaoovMvmxtVRqbILlbSBo3+F80
	NyydfJUGjjfeMO0epkuKHTFDFZqyZSGS2wozY7TKoyElc5M6459LDK5tGuXrZ9pElAJzV7z1pRkAM
	c4i3qcof9nUDzYqu8BW5Ce+l1nP3oZVOX7Gja3rBHC9846drdCE70abZ/2D/wYIMeQ7/2XmMU4+d3
	X9PCO7JCAjcOWOfGP+fw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qsPaP-009zMR-21;
	Mon, 16 Oct 2023 15:32:53 +0000
Received: from mail-he1eur04on061e.outbound.protection.outlook.com ([2a01:111:f400:fe0d::61e] helo=EUR04-HE1-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qsPaN-009zKr-19
	for linux-i3c@lists.infradead.org;
	Mon, 16 Oct 2023 15:32:52 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ecPq/ufRc4Qv3eeTMncKE1OmWtC/umUF7erfBE5A18Bd5kHBsy8kxWUQFaOUyphEKHfLhUwij815aSDNlOdU1wHxJk81z+z4uCApNnfrxnOK+jEtymq/GNjXllk/gCn5pzi2+vk8oCKOFWlGIXAcB8lYFC7gTLj/t6Q63VC07YXXqFHjRFqziuZquNYPIgxj3i+gXgoQoiC1BAKN9Hy11K0V0y729jVHG1QeINLeGjEftDYLaT/uaPUBXUrHebXzDRmzxRpdejpELcO757LkC1oc6eeGHmd+XTAwMG6gcJ2uWwenxnaVW2A5J40nt7XM6X/m/UTYhy3goHJMjnQcTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rqmK5NCCaagNDH0ggOGn2BzmK/isYwNIE3ZYXR+3K7Q=;
 b=cyci7xle+p3VFjrTIPNItr0OWDBzlJidSXKswlXlwTCchKS97fuA6fVqf5jMcdUUCK7tHpybfYTETSSyG0le2XPaxyeTxhS5XeeDuSdzYSBAo5SSG/Aer6+LmqKIsS9j2zgLrRwWxz8zJm4v0/ovUaVQra7/+46319himOaIaFHNT3RwuxG3NYzsiDOahSkRbdZtPC7J//DfjGQ+fQ1I7gCb7ATC7MuF1AEkLI+EaFHZ2wNj5XNpEwz06UwZ05ZTv7I3XP4NUCq66p0ieeTElCAepVBULM/cEzB0b08bZv/X0ji07ylc+b/5L/jcQiJK9kP1tevCwISMQsVZ4SkTWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rqmK5NCCaagNDH0ggOGn2BzmK/isYwNIE3ZYXR+3K7Q=;
 b=YdO+cerQR7ZVSZXNFw2gfysSSXmfP6LEX4R/4/2ieIS7RujOnLeoQwk01CmyAV/wUZGrlPO3W/IJIX4peNXDcDcxE7RwfzqAqMZJe0DeX07X0m0H3trkxfapg2vv5bal+WU/6x7ZeONbLRXi9OVUNTplvZ117W0rC85AA7vvdjA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM6PR04MB4838.eurprd04.prod.outlook.com (2603:10a6:20b:4::16)
 by AS8PR04MB7592.eurprd04.prod.outlook.com (2603:10a6:20b:23f::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6886.36; Mon, 16 Oct
 2023 15:32:46 +0000
Received: from AM6PR04MB4838.eurprd04.prod.outlook.com
 ([fe80::1774:e25f:f99:aca2]) by AM6PR04MB4838.eurprd04.prod.outlook.com
 ([fe80::1774:e25f:f99:aca2%4]) with mapi id 15.20.6886.034; Mon, 16 Oct 2023
 15:32:45 +0000
From: Frank Li <Frank.Li@nxp.com>
To: miquel.raynal@bootlin.com,
	conor.culhane@silvaco.com,
	alexandre.belloni@bootlin.com,
	joe@perches.com,
	linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev
Subject: [PATCH 0/6] i3c: master: svc: collection of bugs fixes
Date: Mon, 16 Oct 2023 11:32:26 -0400
Message-Id: <20231016153232.2851095-1-Frank.Li@nxp.com>
X-Mailer: git-send-email 2.34.1
X-ClientProxiedBy: SJ0P220CA0029.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:41b::13) To AM6PR04MB4838.eurprd04.prod.outlook.com
 (2603:10a6:20b:4::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6PR04MB4838:EE_|AS8PR04MB7592:EE_
X-MS-Office365-Filtering-Correlation-Id: e7a2c9c2-166c-428a-67ec-08dbce5d254e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: nkPouxtl+K1q5hBnnuIsNk3EAoj4fJ268tomyxCR/09vFusrXo20pBydFagLibdLrZYAIKXDArMryDuqCSIbUg5gsTMTAkJ5OHfG1LtjgCzBH9kObB/4/ZTbAKBdviDCUEzEVcR5qbvgyz8CVlPZ/AIbTu4YWX0OEeG1ugrKftJIa4VEiAg1GjU0heIqJJWJ2tsgpP9ueq9Xean0emHGrBGeJOd64jgRTrof+BumJ0nQmnTGDgtIRvkJWTujsuiCv5FjynIKONEJNuUE+HYzfoblpEYHZBu+qAmfqs49Ef+IdgVWu7mpjWHci8ck8b/+LJeby5epvetS2jUHE3B0AN7fCo3gEYJGp4QFlmFrgHzGPG3ZhIDNKIbeg6bZ0809hCgwvDpAygjsz8SijEvxYgIiqzmmmtbuDcmbP61hyxBl3xX9PAo/F52W2ijkXA0wmKF7obZLjpaIZnoUZWcIlhB79d9dd/mfGEPWJQx+P7xz5aAdPA+PFe5ZYgxpJLCeZpagHkedFTuGG0lz+GuOyZbpCOlz6l1lsE9lB2o8zpP/DhN4BVPV8WIFOpx2Cc0jzEAndOWO7X4L+vnihDz4oMpjvDy+dtiHgTaM7FFgzqbUnEdgPVcrS75nI27o/VPS
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR04MB4838.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(136003)(376002)(366004)(39860400002)(396003)(230922051799003)(451199024)(64100799003)(1800799009)(186009)(6486002)(38350700005)(36756003)(38100700002)(83380400001)(6666004)(6512007)(26005)(6506007)(316002)(66946007)(66556008)(66476007)(478600001)(1076003)(2616005)(52116002)(2906002)(41300700001)(4744005)(86362001)(5660300002)(8936002)(8676002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?a0wxY3lsZEpmZXNjS0ZRR2VLN2x6QVUvVkIrbVdRQVpsSzhOZDByQStLN0Mw?=
 =?utf-8?B?amtCQjN5aFFqMi9KeUpWdW9jaFNvZCtHSG1CTktuVHJacU1VRjBLOVVDS25G?=
 =?utf-8?B?b2dnRy9mRldBSytUdGpxNWhQNlE3QlFuZU1tS1lGb1QzZWhLQkplRTVTd2Jp?=
 =?utf-8?B?cWtqNUgvQmwvTG4yOUNzOVZCazJwZzE1RWY4QStodWNKZjNBWnkwUVlBNm1x?=
 =?utf-8?B?UTVFY3llTzJUMlBTRXpVV255K29TSkFSQmJGcmEwTUZhYXJnYVdXYTRSRXIr?=
 =?utf-8?B?NEx0M1hBbFdDTSt5MzY1N25HNjVtZHZMa01ONGhRSzVUZW1ub2xwbFVOdTVm?=
 =?utf-8?B?WXdyaEdLSzUvVlNIbHNWN0JWdDU3b1dnb0Q5YUs5RG5wQVJMZ0JpS2d1OEo1?=
 =?utf-8?B?MEcySC9ESWd0cUs4THNKbHRXQlQ1czg1bGZYT1BYdlkzOEtOb21xNEhmbzdv?=
 =?utf-8?B?T0RNd1J1MWVvaFFFZ3g5Nm90azM2UVhWTXpFWWIwSE55WUoveklEY2VBbjdo?=
 =?utf-8?B?cHdZVmducGFObkxqQVQwN2R3RE1XZ2kxWjRpbVQ0TmEzSFlMakQrQmZFb3Zk?=
 =?utf-8?B?R3Y5WXM5NlNIdGVWcGZ3WjNPcnR5WXJJZW13U0lBbkNHbnNkR01yM1h6ZHJ2?=
 =?utf-8?B?ZjUzckc5ZU5reEdpeTdBbVRJVzhLeXVCZ2FvM2ZHZzRWbnBwTi91dkVFVFNH?=
 =?utf-8?B?YXlVc0JiTmJDbHI4bTMzanZ6UndqTEJDNUNCNXFvSWNzMzRjakhsMGNBVXBV?=
 =?utf-8?B?L3NmMERROTJPVjJoamJZVDhEQ2Qxenlwb0VhcXhsMkZuU1ZMS0JmemE1VDhS?=
 =?utf-8?B?Q1V4N1ByOUw5TnIzcmpVMUJVS1hzSUVZNkxtS3ZIYlJoa1pRWlp2RUlLOWJx?=
 =?utf-8?B?TmUxdnpmL00ybmtheFBmR2VZR21rcFpqRDlVeVRrWHRra1A3b0Iway9mcU96?=
 =?utf-8?B?cThkTTV5TUNkTzVySHRicXpzdUdMK2QzMTZqWElVVC91eHBMTitTWXRYNzhz?=
 =?utf-8?B?c3J6WXg2b0pUemJmZ3lCcWtKVGplbDFYU1RKTkNiQXljREZzTFBSQ0t2dCtC?=
 =?utf-8?B?WjZaT0VGUXVqTGJCZzZsZU56QXpvUDNqbGsxWEY0azAzMlQ5WkpDNGpuNURI?=
 =?utf-8?B?djJxd1p2RlFJaE1iNkdJN3RxL1VJeGlUWnhjamhONndRUVFubjNsS2gyYmhm?=
 =?utf-8?B?b1V4YllneGo0SkN5VlFhNHA4bjJvT3p6S2E4ZDVaQnNObEJ3ck5RZ2Iybnp0?=
 =?utf-8?B?Y0xJSHNNVGxHQ0p4L1VPRElEQXkxcDU3VXVwS3U3S2Q5YVdLNzFKVGF5L1VZ?=
 =?utf-8?B?RXdaUng0RUtQVTlMWnVRTnpjVWFOSFgrYjZPd2IzcU9yV1ZtdkpiS0JxOENF?=
 =?utf-8?B?amlVUkF4NldkMmpFeEpPaHpWRzlZMXFtbENsUlNtQyt3SnVPc0tCUkNjTWVs?=
 =?utf-8?B?R2ZHaHp2YXBmRXVWazZ2UkRHL0VuTmIvS0xtUXdXeWprejY1ZFdwbHJvZyt3?=
 =?utf-8?B?UFhKRWl0UStaSjRHOHBXQXN1cTZwRC9vSmY2T1JHUVRmeXJXaytveDEwRkk3?=
 =?utf-8?B?Qy8wd1RDSzZxcnorVUhQZzFXc1E2ci9PVS90U0dEWHo2RCtieWFhUGw1M1Jk?=
 =?utf-8?B?blgzeTNmS3hpRWtVVlVtcllWTVhOTlMya2wvbFE1b2ZrQU1TcnlLOEllRm5R?=
 =?utf-8?B?Z2ZxeHFnYnFkVjdvZlZoMlFDNXpIcFV3NUF1V2hnZ2RGKzRBcTJIa1BGYkxG?=
 =?utf-8?B?YlhwT2JPTDJqaWFISm1sVUFaQVpnajZrbEZKZ3BGUE1Fa25lMlFWbml1WXVz?=
 =?utf-8?B?U3ptOWViNW41a0I4TzZRSW4yUDJ4b0RlbXkxMFZTdnB0MHo3Nm1OYWF0VVRS?=
 =?utf-8?B?V3ZyVkRMM3U1SkljektXcjJSS2N5ZzR1VnhhbEU0T3ovdVRqMW9FcmlJY2Jj?=
 =?utf-8?B?eWhtM1Z4a0p6SjAya01lc1hVWUlHWTZCYjE2Wjk3SUZUTHRLZkVEOEQ2R2g4?=
 =?utf-8?B?bU5xL0daRkNrbUpwV1dDV0hNQXlIYzdQSG9vRTRXMFo1b29TR1FPUFU0a1N6?=
 =?utf-8?B?NXhNUDR5dVhEZHozQWxCNU9tUDlFRWY1SSsyQWwrQmlaek5QMGZJTmppQk9p?=
 =?utf-8?Q?Nyjk=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e7a2c9c2-166c-428a-67ec-08dbce5d254e
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB4838.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2023 15:32:45.9108
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AWTuF74r2MAN3E2+62Qa+fh3rvxuhSj9LwGMqkrlNNCWl2GZQj7m/ewEo/BQBmY+lyAvSiOU0xQkq8OqWdWEWg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7592
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231016_083251_397221_B6A9790A 
X-CRM114-Status: UNSURE (   5.51  )
X-CRM114-Notice: Please train this message.
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

Each patch is indepedents. See commit message for detail.

Frank Li (6):
  i3c: master: svc: fix race condition in ibi work thread
  i3c: master: svc: fix wrong data return when IBI happen during start
    frame
  i3c: master: svc: fix ibi may not return mandatory data byte
  i3c: master: svc: fix check wrong status register in irq handler
  i3c: master: svc: fix SDA keep low when polling IBIWON timeout happen
  i3c: master: svc: fix random hot join failure since timeout error

 drivers/i3c/master/svc-i3c-master.c | 50 ++++++++++++++++++++++++++++-
 1 file changed, 49 insertions(+), 1 deletion(-)

-- 
2.34.1


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
