Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D300EB5976
	for <linux-i3c@archiver.kernel.org>; Wed, 11 Feb 2026 07:52:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=27X8h0ng1NQ9yO/bYmTs4Z3GHxYrk7T/c2zoFPS2nO8=; b=BzfuG26X9RgtGg
	NP10y/qja8NxePZScOS6Umqpwh6D7Eh2rSO4Hxozbb8ExbcyYzFJ96pyH+mRGcT/OQp2CPOeeRcL2
	FnivTw1AtcEzljuGbsv2vytfBGzU9aI/V7IMpHUivvXK2F6vmTV3StXVaHfmZkWjrl7r3w/vrkyV1
	/C73k5PVhc/HJh4W6xCCKGrITsbPCPd+u8wz+y50LZJljSg5dHYVqJfaGPiGuWSYAsrpr9VSH3dtk
	0j58IOJnvY5vxKbLcf2B4VNh+sCMJN5AE2MKtoXFZ4s4PReA05E4Fv8JhwaqqsLDMWP8VRek/XvVa
	Z9AaybPL7z0PtmhFVhKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vq51f-00000000MT8-3Gvw;
	Wed, 11 Feb 2026 07:52:43 +0000
Received: from mail-northcentralusazlp170120005.outbound.protection.outlook.com ([2a01:111:f403:c105::5] helo=CH5PR02CU005.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vq51d-00000000MSW-1s9e
	for linux-i3c@lists.infradead.org;
	Wed, 11 Feb 2026 07:52:42 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Zb8snjnEhqcI/lCEQzne7RKWoAEpyApOxdgF1Ed5ASCyQMnQrfTWje1O3G93nIPbEpKBe64DrI1TOCzi/PT47WBWYkHcLr5g+j31Wb/EBkSMWDVSlH/V7sr+ZYTYQ3g+ON/GdR6Tu0KFNyPBkfnn609o/BePzhj0u9CJI9CvjuelU1nkGs92vyK8OToeLsUcgLLycXLJPOYmds6FSNOnNy8NVmUNX44swGInQ88GB3BOb/P/7JE1MppABI3wKaMLEVc+c79F14D4Dgrbrj2c1WYB/I3qlMxmQCqeoxk+XesiPhZvkn47uFLdEiNiBin6c0KUj0yp9ePabJIxOjs+rQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xfjMvTEHohgyDHmbZugabdc56GdfyOg/BXugeuiIydo=;
 b=H6qx4eYKKu94tqhlOcai7M2u5oRxjaalFe6YuOqmKvor2aGPy4+2tode9LIFaYVo5baYXstBnGXOb9ysYRP+SSuVlL5Wkpam4o37UsvvShSlVEMw9GTGPCxVpJPrXvjj9OxqB1M2RxT3yYIsY9jbpk4//XLRX8KBWF3NzCTeioce5T1/jpsGV0zbIXGGCWYEjBTxIrRVyHOa7RzPRUCe4ydXEymfW9+exMjpXrZObAUCCraFnbBiIG8saocvqzgMJsE7EMMsEWqydScsG6TF4tAhK+kMlx4MxVP3pN2GWyrZQZtvVJgVVzNj+ej9K7gS4lUNqmKpWACfPJqESA/tnw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=altera.com; dmarc=pass action=none header.from=altera.com;
 dkim=pass header.d=altera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=altera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xfjMvTEHohgyDHmbZugabdc56GdfyOg/BXugeuiIydo=;
 b=vXeLdgwSvRIGirpXS8KHDhi8ZBOLosJHaCrt6urID/D1GW5b8OxjUDLUvneH9fbXvQ2pkkIMQ0Ia5+5oRQqXJCL8Ck9gTM95Hn6KAbwDVqgvaDmRdV+gA5OqNfaQGsd9p5Sgl62Pdb4f5UdD4EVDMeWpY2IYYoWW5VlacHfwApkQTU/57xN83ezPK7amZZpefgepzdr9rUDkDYPzho1AWEolPSA7MV/AkFXdegE6Y8jkHeothAZNsBBXt0Hckg/ZG6GMIGDXrKdLUrPdYpaumjijjcwnPlj5gp60kbZHThjij02VrBOM4mbLT2t1JFCZipfc/DwS+H5uabsq9d5xKw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=altera.com;
Received: from DM8PR03MB6230.namprd03.prod.outlook.com (2603:10b6:8:3c::13) by
 CH3PR03MB7314.namprd03.prod.outlook.com (2603:10b6:610:1a4::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.18; Wed, 11 Feb
 2026 07:52:36 +0000
Received: from DM8PR03MB6230.namprd03.prod.outlook.com
 ([fe80::abad:9d80:7a13:9542]) by DM8PR03MB6230.namprd03.prod.outlook.com
 ([fe80::abad:9d80:7a13:9542%4]) with mapi id 15.20.9611.008; Wed, 11 Feb 2026
 07:52:35 +0000
From: adrianhoyin.ng@altera.com
To: alexandre.belloni@bootlin.com,
	Frank.Li@nxp.com,
	linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: adrianhoyin.ng@altera.com
Subject: [PATCH] i3c: dw-i3c-master: Set SIR_REJECT in DAT on device attach and reattach
Date: Wed, 11 Feb 2026 15:49:21 +0800
Message-ID: <8bff67c9df8d56a3d5e0191bc935362ff6d3c573.1770796093.git.adrianhoyin.ng@altera.com>
X-Mailer: git-send-email 2.49.GIT
X-ClientProxiedBy: KUZPR06CA0007.apcprd06.prod.outlook.com
 (2603:1096:d10:30::11) To DM8PR03MB6230.namprd03.prod.outlook.com
 (2603:10b6:8:3c::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM8PR03MB6230:EE_|CH3PR03MB7314:EE_
X-MS-Office365-Filtering-Correlation-Id: b0825f75-c0fa-4926-c2a1-08de694281f8
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?I4wmHwahJJyXHP+67eh+jBh7R44k7CR5LfH306wTrxnoTpJ0rVncfeuBC7XP?=
 =?us-ascii?Q?mQsALaquZPcXU0krp/YU2dA69lPQgAVhVVHJPzOPj+RChdzKxxhrq6qreMRW?=
 =?us-ascii?Q?WUuEN+enzOj+2ArjReqBdZcjdqPUdGwdaTdYtqghmXcyImucj1Nu/5EOUaOJ?=
 =?us-ascii?Q?h/oR8150il1Tlpu3EXglE3wc3BSQ2EyyMz91K6XFWxhb2/j89JZMgxSFLwDk?=
 =?us-ascii?Q?XlRMO1w+VIofy4iUeOqGpHJHNF0FlH64DXVl0YRkn1oGBhaobqry9+CG4Y7t?=
 =?us-ascii?Q?/N7m/+WcPDlW6GnLWrE75dQj28jBLiBBtSt2m6S2I3hKYaEv5olYbcs09zLL?=
 =?us-ascii?Q?HxLgPzIU3XKCbGUYMpu26cVJoWlLOGs+lZHSWq2jltSgMyukQUja972KTimB?=
 =?us-ascii?Q?LLvkqLmtOFryBUxWvuJ+fmLy3ubjiGLd8PLE2eSw5UHtb1Tu9K/reJgknAZr?=
 =?us-ascii?Q?3s7LUZCXv3T8QFFKKosL5IWl0SiG3rTRtlSLmWWKO7XbEO/7V8D42pzuVfxS?=
 =?us-ascii?Q?X98HXIi9ArUIuU1nPN9C5Kzji73r25HXeS4XJQEnptSh5/pb1wS0fzypJzcT?=
 =?us-ascii?Q?uIMku/gz8evbjQ+8/4N5HGpTb7qO09MG+uMrb8Y2X/awS3SJnFpUvTvK6ia/?=
 =?us-ascii?Q?ZL3ywpkqn82sO4vBzkQ37CFIfk+p9dWBTqiMfbdZZ4qKYDJpOcq0VzW4ZkA/?=
 =?us-ascii?Q?FCLpRy0xUI4WfGPgeqmdFQstUpL0F/sBhP1fW5w6ZrHZkZn/XYRmbRGVpRdY?=
 =?us-ascii?Q?cAixR4ywV+KWYYopCAD/cMub3rsA8KxSdwuzXFGXhZKiPyPsFwkEh9d1Pfw/?=
 =?us-ascii?Q?4r1Asoz4UpKcIkpe5XmaRuaRL+ec+HtZsmKoXa3tShKzI7tDRNOh8uYTYCle?=
 =?us-ascii?Q?q1NYg63d3e4Ja7jr+X4d+Kjg13fDHn6DhQEkIfzRKDY33qbDD6TULAdzyN/b?=
 =?us-ascii?Q?dSWYj4FWWNXBaeck680qsSEfKLOsuHYFTDiDNCoqMAo+45JA1nv26viwr+T2?=
 =?us-ascii?Q?2kzUhrSDFzNGPTY2F3iWwFPFF1V4cf/fLehKuwmgXAVXNwbzw7Lpit9TALaj?=
 =?us-ascii?Q?BOp3x55jxjoTICnnhmiUld7HfLzHrTRGbrvBQ2MrjT7KXa+sdCTyPenm+yu5?=
 =?us-ascii?Q?OZqQhpK1pEe/67k7G5Hc/XBSPiPlxA13FreyZBcTPpswWNv8AsobpuB9WTI6?=
 =?us-ascii?Q?pCpZd59RsikEc1KlVcqx+zMrcqryD9VJ7YoLgt0pcTj7hv8VvEyTcCQO3I2V?=
 =?us-ascii?Q?v9MAoNZ2epM5du2Hr6YGbLphNPq3KXuka0fOP+w+ahh3QDwg7+SmmoshV8eE?=
 =?us-ascii?Q?/EKU1U3FJ4Z9WqzEwvIhWQk9lTF1s2wYDJCUVSJ8n084vjpcEl4L1CgWgnML?=
 =?us-ascii?Q?P+a0DKFqIwPfXMgO1iyucPdqUj8HbsIIbIL20b/cLk3pzsR0RC4QEWSWEoi0?=
 =?us-ascii?Q?rLggtEFV7HP3CyRs/Sxs1JOf3ePyoPZV2WJtyiyEgu1qBebNOJ4m9SJY7K0E?=
 =?us-ascii?Q?MsZQyA+IeaHsKUUskWki12HZPoAYfshnAnIvLtLVf+sRFsBI7mWzOyU6tpO8?=
 =?us-ascii?Q?ojdvwfaFq84m9xW9Cnk=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM8PR03MB6230.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?DYeAcORrS3hk5SOWc9FJFKjWTzSlDhaME/rYoEnoaEO3BlFAa73liVm+t3bs?=
 =?us-ascii?Q?1nC/1Esjjyq3ceCnDPrFrZWac07gEltQTc6rSHhQiVmPJ0Z+20vXhHMFJ4Z/?=
 =?us-ascii?Q?RMjU4FQ6DATDIysssVhTuPosHzHAshmY8W0iS442QXwidT9oqo/xiFrAW/0K?=
 =?us-ascii?Q?Wv5LKuXJOOrQJvVdU0K7Jkv47HRt8Cu+TaVsbsplSghd6GdXcufM6GvlU2cY?=
 =?us-ascii?Q?AlcqE6gMCVpBOQZ8NwAbGLZj+PqBbj5Zr2hPPuUVDnJmBCUt/r5rB45b2RzT?=
 =?us-ascii?Q?uhEabWIPXBxw8bQgthot0lDzlpZUaCU2set5NrkJwbGBuiZC7IAeb69DGVsO?=
 =?us-ascii?Q?0GOJV9xX1UbDMGCcgmUBnvoH8HRTyh/s/SqhZ910bFROu5c96kjRx/9doyoA?=
 =?us-ascii?Q?RTXsT6VNDlBn6ccHWyaAezBC18LFDvofSrzjOCYChZCji7td56sBP/GU6jvJ?=
 =?us-ascii?Q?za1MS7TLnQY16Ky0FcAkv6PDTaYwpXoL0VtJ/L0n+4vuCXeLHm8bm5o7zbDM?=
 =?us-ascii?Q?ZmnkGigrLsn9LZ59izbpu61H6HhxbGCtICZJ+8DY3xmmAvKrcZAUI2t9Kx61?=
 =?us-ascii?Q?e7KqaAZ97ygLuhw9y2ehbRzi8gUTFqG6RUa+tNvOpnQSP+uW/uRqu9OKQtTR?=
 =?us-ascii?Q?YklBCQ3+ck3nHGE9IJylRxPQmLrdn3PYH9XeqZiYttYXX2D+MztKa4NBG/No?=
 =?us-ascii?Q?2Cpoh7mZZJyXsW5YjIEVeo8riv5qrDjGYtqm38Ppslcvhizg9W5rCdgmZHAe?=
 =?us-ascii?Q?uqHyUDY63PbtAptMbyB/1fTjwF2zMMX4UbopEDu8H6vZ1+4rDf2l6lzMbCCB?=
 =?us-ascii?Q?skOxAt2gvDaiSy/omCMp0wHhp4ltx3az5C7k9/nGZNvhWbGjtW9iFjxFzviA?=
 =?us-ascii?Q?JSSmJahbcg6YcWxA8oMOhqn/JUP2ZnSEFeZq8jIzgmdpu9OZBiUpnINJdNzJ?=
 =?us-ascii?Q?3C4jzQvmCr9d6JyC1g0BAIwEKEeS3MmVWQphhKp288A02saVwPsQ3OaX4nXS?=
 =?us-ascii?Q?yLn678LeXI6X8BmZGdxmXZCKMVOqEeoJnQji+GtyxRT6A2CERE2UMZ+UsRvk?=
 =?us-ascii?Q?UT/tmhgBZVs4ptizhdQ4t7ydG0ewnatibpbBckFEkSpjzg7HDhaqFVqscd/T?=
 =?us-ascii?Q?ga/5uANkpMAqPUeIHNloDPz2tsdTQlXy4c9+xlubZTGwpkTQ+iDpRfn5TReb?=
 =?us-ascii?Q?CSk9skdSj0UydH3+WeIpSWCx5CXqqtqv5T80GKjXVRtIV6Eqxcduhg8j3k43?=
 =?us-ascii?Q?Z57tuAJbwDa50mnBQwkYBUXM6KhldIho5OOg0B0saFtSYZk+rpFaEBoC/Ku3?=
 =?us-ascii?Q?IirTIaodubkbiBcB/M0nArdgCksXBQS1RLRkQcpNwTjdlmsddl7bUR2SVw79?=
 =?us-ascii?Q?Ldg9MCCzOwIPygCcMW7mKIUpXlbCeK7wa8UopF65DtEdoLv8w16JSNod3Z/a?=
 =?us-ascii?Q?xPHDTi1AIVYowKPEEklC+8irymMUntlu3hW/Yq7DgcowlWnn7K/clnUW7nlW?=
 =?us-ascii?Q?NaNTN9FdzDMbpqA2q5ToO6JF/RhovLFB3EYqDfCOzZMr7UbsBCQBzF9sCOmz?=
 =?us-ascii?Q?VGIzJV5H90lGYQCH5R6HPRCludRlEUNN+iHDuEKOBsx2FPVT290Kq9I1bGaK?=
 =?us-ascii?Q?cyI8etShNltpjHSvXL/7cT8jvfIjoxAnDqZNVLtWHvDVevJdtNE/lGthAryn?=
 =?us-ascii?Q?Qkl6y/oV8RG4m5VjB5ghetE4LHDcaBwnvAGIy3A0BqPfQ+Y0g8+mKaZFz1dU?=
 =?us-ascii?Q?yGhMCrPt/AkWjlN7YSI5YLqtmQO/BGQ=3D?=
X-OriginatorOrg: altera.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b0825f75-c0fa-4926-c2a1-08de694281f8
X-MS-Exchange-CrossTenant-AuthSource: DM8PR03MB6230.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Feb 2026 07:52:35.8568
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fbd72e03-d4a5-4110-adce-614d51f2077a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2rCvXL1cEA5E2pzgNlK6FaENzKw18sphuxtVo1KF8ueAPymKS9jwaT37FNN/fUSnniQUNCRRZH04kK8viqWnegfm7oKQr2MHL/GbnvfueME=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR03MB7314
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260210_235241_491185_7799CFF1 
X-CRM114-Status: GOOD (  10.15  )
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

The DesignWare I3C master controller ACKs IBIs as soon as a valid
Device Address Table (DAT) entry is present. This can create a race
between device attachment (after DAA) and the point where the client
driver enables IBIs via i3c_device_enable_ibi().

Set DEV_ADDR_TABLE_SIR_REJECT in the DAT entry during
attach_i3c_dev() and reattach_i3c_dev() so that IBIs are rejected
by default. The bit is cleared in enable_ibi() after ENEC is issued,
and restored in disable_ibi() after DISEC, keeping the controller
state aligned with the device event configuration.

Signed-off-by: Adrian Ng Ho Yin <adrianhoyin.ng@altera.com>
---
 drivers/i3c/master/dw-i3c-master.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/i3c/master/dw-i3c-master.c b/drivers/i3c/master/dw-i3c-master.c
index 7eb09ad10171..d014f2cd6071 100644
--- a/drivers/i3c/master/dw-i3c-master.c
+++ b/drivers/i3c/master/dw-i3c-master.c
@@ -1024,7 +1024,7 @@ static int dw_i3c_master_reattach_i3c_dev(struct i3c_dev_desc *dev,
 		master->free_pos &= ~BIT(pos);
 	}
 
-	writel(DEV_ADDR_TABLE_DYNAMIC_ADDR(dev->info.dyn_addr),
+	writel(DEV_ADDR_TABLE_DYNAMIC_ADDR(dev->info.dyn_addr) | DEV_ADDR_TABLE_SIR_REJECT,
 	       master->regs +
 	       DEV_ADDR_TABLE_LOC(master->datstartaddr, data->index));
 
@@ -1053,7 +1053,7 @@ static int dw_i3c_master_attach_i3c_dev(struct i3c_dev_desc *dev)
 	master->free_pos &= ~BIT(pos);
 	i3c_dev_set_master_data(dev, data);
 
-	writel(DEV_ADDR_TABLE_DYNAMIC_ADDR(master->devs[pos].addr),
+	writel(DEV_ADDR_TABLE_DYNAMIC_ADDR(master->devs[pos].addr) | DEV_ADDR_TABLE_SIR_REJECT,
 	       master->regs +
 	       DEV_ADDR_TABLE_LOC(master->datstartaddr, data->index));
 
-- 
2.49.GIT


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
