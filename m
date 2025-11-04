Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 959E1CCFA00
	for <linux-i3c@archiver.kernel.org>; Tue,  4 Nov 2025 08:53:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VuxNB23xM9NR62eHDHGA8hmS/JHB9+hsYRa128Ui864=; b=TAoDIYQ+vUmXe+
	qNd5sKpmXArVyu0S0aU17bmfVRdABt2Fmt4UqnqaKbgRigDJnZPYRv4wYZgyCNtrMdp+pR3/AJqiD
	0JD5G7SqVI3UmyonxyEsNPipKo5QU8sN2/TGZSBdZPph+tbkYgbswj6N5mwy42sEfJ4syFNPc2fbA
	kZxibydl9py+CcMzHK7aYlD3ht0gXeuJ5TbYN8yfMN/RVMhy3aL8K29JogyU9JFWo+X7V9Aip+QaT
	WFkylMJFiirc8XJOizzlRcqqUuV7XGFTE5d+9BuwGBq2eiaUdhf+CDQL+Sdq/9FuxSMkrHvA4x9/1
	upeP7KLag3d/KJbnpxwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGCnR-0000000BTOw-1YSD;
	Tue, 04 Nov 2025 08:53:45 +0000
Received: from mail-centralusazlp170110009.outbound.protection.outlook.com ([2a01:111:f403:c111::9] helo=DM5PR21CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGCnP-0000000BTOD-0GLi
	for linux-i3c@lists.infradead.org;
	Tue, 04 Nov 2025 08:53:44 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RjuF7gXrIR8lLeqd2D7/0TqOJcezbldQnrSNtePk3DyzL8Ga8qHbqc5U9C4uVeBxdLFqOsl0MwXmXTlMjEeFGkhDG9832QvWfZZSuSLsiVZxoJbHFdUa+5ydiGEpcWwuEpnInc8kH0r5Zvu8ekOdeuuKdSSzxtLPPM3cGTHQwT3MvqYYOAlqOaG5PlT5zouqjhUwtdY9RHDxj4guHDaSUPUiH8ACQbFive40pBXJvHWX7jEpe2jJ37J8zXS0tByzgeAUIf4ibFFBbf5Q+ndU6upHyDuiQ8M12mgyga7a16t1a9nmf83vzaqfRbqEMAGm001IiUmArYfbaVMU6Kj+lg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FwbyjKE5fcVt6l5f9zLnaOV6ff8nulqlhg5sJsPZMBI=;
 b=embM50WmxrlpOZtXTRoofsT3WFdv7Np2gUwzXqJg24f+iqoldz4fMIdu31VSYY5R7d421JlYtx5nmzwx94gWHFJYYTfCyxxXdmcU+5gt8s0FBnJkvI3LjVh86wg/79CUGl/9TZHwvvJTt2A9MzUKf6iRStpPKDL5KuQVPv2nsHMFdxrzwrzaVfRk0fcH8LBUcKJZ4j1fxeDGwJBGypSP4iKibWD44wk3CHFxXUc5I6UBrnwAymLhTtAZ0nLl7go8mP6iFJotnbRe7ehnHFSIHmwMldqLA+bDGeABYGI2HlhCOur1db4oI6xtLb1wHZNo+YxdMdNTtTrXkWh7vXyTJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=altera.com; dmarc=pass action=none header.from=altera.com;
 dkim=pass header.d=altera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=altera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FwbyjKE5fcVt6l5f9zLnaOV6ff8nulqlhg5sJsPZMBI=;
 b=DXa7B1yjpNe7wr8qpUKsvqCpQ0Ah/xhEsl3ZLlVZSukY1yfOY/3aVd8t7+VJHv2i8CbivquKmu6P5sJdqvo8Xrfm/r5+ltPQ9LiYX/K4RGe6jO5fGwe2CDm6ab42+NWVrIBz1p6u6IcA/HD90AiIMecmy5q7KIOVLN9K9g+JMTP3oDSsxvkZOuqD1vNSEdR1J5ZWDyWkqpDa1EVZrQdbcIbOzPyhWLEC0ClmZrR85mPxlLcetuWaeehnvjpl1+7ZWGUOjnPOkxFuXlF8GB2E8Lx33tJb4BHLfmBMx2bsSBDHYk3lySkhZ/tpHerLuahcgrEnraBgC1p0jdYk9654jQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=altera.com;
Received: from DM8PR03MB6230.namprd03.prod.outlook.com (2603:10b6:8:3c::13) by
 DM6PR03MB5164.namprd03.prod.outlook.com (2603:10b6:5:247::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9275.16; Tue, 4 Nov 2025 08:53:38 +0000
Received: from DM8PR03MB6230.namprd03.prod.outlook.com
 ([fe80::abad:9d80:7a13:9542]) by DM8PR03MB6230.namprd03.prod.outlook.com
 ([fe80::abad:9d80:7a13:9542%3]) with mapi id 15.20.9275.013; Tue, 4 Nov 2025
 08:53:38 +0000
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
Subject: [PATCH 2/4] arm64: dts: intel: agilex5: Add snps,dev-nack-retry-cnt property for I3C controllers
Date: Tue,  4 Nov 2025 16:51:09 +0800
Message-ID: <cd462b04f5ec5d425ff900823e596f193b373fc4.1762245890.git.adrianhoyin.ng@altera.com>
X-Mailer: git-send-email 2.49.GIT
In-Reply-To: <cover.1762245890.git.adrianhoyin.ng@altera.com>
References: <cover.1762245890.git.adrianhoyin.ng@altera.com>
X-ClientProxiedBy: KUZPR03CA0028.apcprd03.prod.outlook.com
 (2603:1096:d10:24::8) To DM8PR03MB6230.namprd03.prod.outlook.com
 (2603:10b6:8:3c::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM8PR03MB6230:EE_|DM6PR03MB5164:EE_
X-MS-Office365-Filtering-Correlation-Id: e6ce29e6-9b02-46d9-32e9-08de1b7fa4f3
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|7416014|1800799024|921020;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?+fqjKrYls2rkxuciUNdJcC6oHeKTglvQuDNHkjEDzBzVZQNy1J9r7ox+cqq8?=
 =?us-ascii?Q?DVvGToPtkKEw7XnC4VCi6K5dXXUPkRYlzXyoVPo6+nmw/wXsz61ffUSWQPE0?=
 =?us-ascii?Q?1rci0/iG9ocGZ7OrJ3qNV9La2DxJWn+vSBU3KYfnlbBX3B7+XNBbvgddRXS+?=
 =?us-ascii?Q?wKAXv0y0DduUlayi6Qs3zbtp/VYbw2O33u+2Eu4ejFyc6TbwA9GaGRgRfddH?=
 =?us-ascii?Q?oXaz4VuRQjTajVSTOIkZqpAxTITDQfqPmyQQIm5gFduzug8F9NBScCb3q3Zs?=
 =?us-ascii?Q?Q0n3tcAvsnxVjWgMH8qawQPKF8CjyVCqFVd1OwxMNJ5qzoeIMzg8JacMtTeD?=
 =?us-ascii?Q?2YpCcF8I8oUy13feX7AXW4W+vR1gaarVtjbPEckxRob4nJXY/jGN93uuDv+o?=
 =?us-ascii?Q?+leIdT4fgsfYZz0UWh5WMoXYrNKnudycaSVPptcEAkQGmq7LEZfigy6RBMql?=
 =?us-ascii?Q?sp5M8iHbUfQob/Lyx8h1G+HWyWWqqg5LqcQkeeY2bEmKBVi7EMzOwj4gMivT?=
 =?us-ascii?Q?+ccdeLejWGAWew3VoSRQrocMTw/LpFL9BQKb6p46wMp/s1RXJ8wK7rXJDii9?=
 =?us-ascii?Q?QzOATLU20o9K2mj2+1fd7ElAjJk8osXpUME/o2kq9Po+b3pBpG12XhfI18y2?=
 =?us-ascii?Q?jxYkuwaX7WuN3g30O9LRvq1Zz1h/pTaqZ0z3ACVZFlZA4uCnvVnGBR1Iv1K7?=
 =?us-ascii?Q?Q12cpoAfpotB+cp6vzRbRXfIP8zr0LSrYUIOp/iHn+GBcGAEh62MYTV0nmZh?=
 =?us-ascii?Q?+11lS3EiE0RoHKMjxhRiH/jajRNaO5ROKWoxOszMxKjxzKXXUdiWTa60f1gl?=
 =?us-ascii?Q?oaP5XL80MxASsjFLFIy4xTRVhaosTfwE0l0GOQKDmbG8fWV3/YM9HlpiatpD?=
 =?us-ascii?Q?ba0R3D9OW9m6s0pf6o2quVJEkAvW0ZpJ4OOKrTtzYkrmjCu0N53RW+ysp9xw?=
 =?us-ascii?Q?681V//IQgGCXFHzjjt45G5HZ3Ev7kA/ftbnJFyXMlPYTShMvS2/tGTPYP8Fr?=
 =?us-ascii?Q?Q9yFvwMhgKA914NtMJ2nQsGel9f76C83KZDf6g54WVUECiYa/DvpeStaOo++?=
 =?us-ascii?Q?jsL2ZZ2x99WHEFanIEOy0/WcFq6RPYKCgtY5uNSTBq1S8ToiR5LZ5ArF266/?=
 =?us-ascii?Q?Z8hoPMe2mccrd4x9Q3/ckYBh4mvaN+sVU4xITrqfB4AxVfXbd3LJvpW9GoVG?=
 =?us-ascii?Q?A12GH9Zw8bHafoZmQjW05yGV1aAOiRjoHYius9WUkRKICOgMRvgqif3dp1tG?=
 =?us-ascii?Q?pGn1R8fL992PlAiJWRQ9qxXWtUFIZ8WHmwExAE734v2esz6+8m0C1RFaYnMS?=
 =?us-ascii?Q?gf/FViaM2QgXIthTVxtKOnCzza6TM9q/XJ4cM3LsqlAC/YE//3AY2MZeKmaG?=
 =?us-ascii?Q?WOpnLJXmOTrw40q0b67F6HffcA12v/aWPxjiNzRBDJhdTygiwc1cDrcM9rsQ?=
 =?us-ascii?Q?y5hYj6dI1nGypniGn0ShJvsf2BUqiDbzlEHvh40n+kYYpfkWT6arPtFLsciF?=
 =?us-ascii?Q?wmZWyec6tSq3Hjw=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM8PR03MB6230.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?2baUqyEgoXf8EFs9mOa1NoRJRiTn8ah3xtnwUtOyuh0cTZ6UYJWxYY/hgPy2?=
 =?us-ascii?Q?CY+QO4ReFxXH6IdPujA6pcXop+tbr/jewlLi1BTGE9kRKVZswL8Qx3NNgqGT?=
 =?us-ascii?Q?8QNDt1/UW2L0scAMMvVS222OnhG2gOw6SXlusiIk97klJSpuaQwXyV8QYEYO?=
 =?us-ascii?Q?jMvVYAkN05jgJyQ5n9qhC7R5rEPC7CtjNGGzThk7lbAac5rSvvvQa8/S4NcX?=
 =?us-ascii?Q?liWmhDY8c8WTmFBHN+BoDAz/3wyAG+c3v1c7IjvXMo8DbWdq3+rO4qapYyQn?=
 =?us-ascii?Q?D6QguwecV+Doo2MlfuDQSaMAOQzzw+ZM3K93t5ekK2QpIvXCkz2kzXgiGTRG?=
 =?us-ascii?Q?4HZyNkH6Y3e9ThlwVF0W3x1nOfRzTygRSAne3PZM49uLGVhqaGdmi4zKzpAr?=
 =?us-ascii?Q?c6Zu6xAwVmNWvApVfpx0vqWiZE1y+WE8qLTIr7ie+0EAJsEdzDoaj8S+jej1?=
 =?us-ascii?Q?e3drkU4OQ4+YEcqcF43dPQqpeyEJ17X1fJueelA7fsR9Bq/8iOonYNyMo7Z3?=
 =?us-ascii?Q?Oy/qNLfDav1OyiYAHhFs4yJ3quTWjwiFi86w+6FJebqfA5MRjyRRSIV6kuL3?=
 =?us-ascii?Q?Ty+q+31D+yBdZS3qUdXBHG0B+9OEqz33C09aksOZtaK4c+VJY2jYeJW4pFLZ?=
 =?us-ascii?Q?lj86ExGm0eYtnNQo8ABjyA8om3oNu4/XXE7Xr7kc+QYXVFSmseTyK/uYp1NG?=
 =?us-ascii?Q?bzQmKqj+ITCxYQDfBfi5ChvEK3B64mvQ8m4egp1T+aWKs2MH19UOBjRm7bXf?=
 =?us-ascii?Q?qRaZgA+FyvIkW1pKp6a2js4CECR3Dtr4QVtNtCibriNZj6+XrjZN7TMGNvG0?=
 =?us-ascii?Q?yylGWC7U61MQRn6zr52B4Wfr+N/kKcJ8D0W+G6cYk0VHpuhfnvUsvLJYopWO?=
 =?us-ascii?Q?DRRBnfZrPRYagP0TkLUFHcZ4q67XMdqBjWgRTQZ6krIv8Oae0DiJ04lRTaSl?=
 =?us-ascii?Q?suLLdNhx1f7gb3dy4PFq7ICUXQVcmjv/Wa+mMOQu3HkR1z/Lb5EB7WfCXwPD?=
 =?us-ascii?Q?ap/MDdeospnIBs3f6waRcsjDpwZvj13Ad8gX1bIa73l7le7ocVZ8VnoOn9mw?=
 =?us-ascii?Q?AEw9jSEfGGuLYEa6YOZR2ZM+XskO6ueAkvyyulESSdQdVGPASL4rSQYkTkXN?=
 =?us-ascii?Q?H2QzWpPe+G+V37oa/9XX4r9fD9uj82enAWmtFIoS7OTb6Gjyh9mRSNcFP2O+?=
 =?us-ascii?Q?+KXgB1f95GbweOxEW0OSetDQicy/iHl1c4q+qF+2bdmWMhLNH1wdSws6OnQv?=
 =?us-ascii?Q?lo9KXbrynzBX/2myuaLdFJhVU8muDHC1fQn6Fi55sf52udqwWHYj2ROYpgP4?=
 =?us-ascii?Q?nMuCcmDM+N3WLPxL8odsE0G5kIvlMrd2PJo5A1Q/oqSIsFxTGGUAhDbcsUWp?=
 =?us-ascii?Q?2EHERT8sz/OE+9/weWIHB2kajrT/3de2bVwVRMWd8dxpF4O4H3mswqYKXh02?=
 =?us-ascii?Q?NQU4Sli/zDVoSdlDtAN5IOf1hTwC5CL5LJtTa4auvliJP3owZEiegEsoh/dr?=
 =?us-ascii?Q?1cSuQWH8f8ZkqF21SYTLIfZr6zYBQnrPMwX7XAVhKStbCJo93BRZqehWr4Kj?=
 =?us-ascii?Q?wjAuQEwnbMmwTdPhKDutCJUn20J6/H7izqmMUkKoXfrJU052CguLLdW80l3k?=
 =?us-ascii?Q?+A=3D=3D?=
X-OriginatorOrg: altera.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e6ce29e6-9b02-46d9-32e9-08de1b7fa4f3
X-MS-Exchange-CrossTenant-AuthSource: DM8PR03MB6230.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2025 08:53:37.9209
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fbd72e03-d4a5-4110-adce-614d51f2077a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fSqE4OK9PuMoUOil9WD2CY9Rvtlv4zx3V+ELWaKQ6IEPRmjA+b7fA5mtztxLm4xK2EEdCRpi1rmuVYrtJSoW48vN6T0ikK00elSpVrlUNrM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB5164
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251104_005343_133599_205E6A0B 
X-CRM114-Status: UNSURE (   8.24  )
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

From: Adrian Ng Ho Yin <adrianhoyin.ng@altera.com>

Add the 'snps,dev-nack-retry-cnt' property to the I3C controller nodes
on Agilex5. This configures the Device NACK Retry count for the Synopsys
DesignWare I3C master, allowing it to retry transactions once when a
slave responds with NACK.

Signed-off-by: Adrian Ng Ho Yin <adrianhoyin.ng@altera.com>
---
 arch/arm64/boot/dts/intel/socfpga_agilex5.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/intel/socfpga_agilex5.dtsi b/arch/arm64/boot/dts/intel/socfpga_agilex5.dtsi
index 04e99cd7e74b..bb508d092fd6 100644
--- a/arch/arm64/boot/dts/intel/socfpga_agilex5.dtsi
+++ b/arch/arm64/boot/dts/intel/socfpga_agilex5.dtsi
@@ -209,6 +209,7 @@ i3c0: i3c@10da0000 {
 			#size-cells = <0>;
 			interrupts = <GIC_SPI 164 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&clkmgr AGILEX5_L4_MP_CLK>;
+			snps,dev-nack-retry-cnt = <1>;
 			status = "disabled";
 		};
 
@@ -219,6 +220,7 @@ i3c1: i3c@10da1000 {
 			#size-cells = <0>;
 			interrupts = <GIC_SPI 165 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&clkmgr AGILEX5_L4_MP_CLK>;
+			snps,dev-nack-retry-cnt = <1>;
 			status = "disabled";
 		};
 
-- 
2.49.GIT


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
