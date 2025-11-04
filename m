Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2AC9CCFA00
	for <linux-i3c@archiver.kernel.org>; Tue,  4 Nov 2025 07:31:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=j/x9lTUT0Js9xpq+tbutXRW656/ZBXDwI0u39XQocQ0=; b=Jpk7n+EjARyugP
	mSKzbnbfCdw51foxNNXBYg6TqNrDfsxv4a0GKuGbK3MFjUHDTMYTaGdy/1eE6etQjJBs3SFVnnzQj
	RTqn75u9/OhYiAzrPpRLF4TvnDIGNKOxDqJNGBSDoZaW3iguuHk+ATQ7z98rLxPRYAWc65BF9aVYQ
	G5gCplPEMN39E/sGZXe/6qxtfApOqWat2TP2IVKlbJ8KJ+mzcuur+5IdB3mZ3+PY745JrpFOb6RuI
	bI5gGF97lg40F5TENJAIRrElRbQHVjdh7XTCc/aZKEwhHCi+3WqUnOZEQlQ5okkuCWb5uX5s9PJBx
	7Jm3XlQcK1AV4kiHYl/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGBVy-0000000BKmx-2r7y;
	Tue, 04 Nov 2025 07:31:38 +0000
Received: from mail-centralusazon11011022.outbound.protection.outlook.com ([52.101.62.22] helo=DM5PR21CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGBVt-0000000BKlK-2cBN
	for linux-i3c@lists.infradead.org;
	Tue, 04 Nov 2025 07:31:37 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nv2K4nv5B6Y6IMUiRMZJ9FrThhvANLkATjTHek/dWYqEKDscWfLfbJl4WBdyCPQkEfckD8jDNoCoDCWt1+CON1Mf6Xz+mcySAa0Em14laaCMsc9KSoXKOqhNIWT0tzfojSsFoxIGfyGTbdZV9WE7L07VFlgAKI4SToBo2XjavrkmUNTnED8CDOtAz1MzcANn9oGfYaldHDDK8IEccG+5yxJv81NE3EdkiL0AZdCjf3T2lZfa+SQnpnF5jhZzEeFPwwTvAdADvrUZvWnhaScoipBEWVfOMxg6u+B04UjtqJ6D3Jk1P5qdT5UNMG7REjmpIeZudfxM1TkxkhlPacXlnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dPK7I2LT5n0ok0gTQxFoVcsOJ32jCSrYKBelLufnswk=;
 b=N3wrSmsUJZB1KTC6sPeO1Os6hGePpFAus+IFQNxm6kNBZ3+xThORoysXXMAZbXtFiDOBuknavzNHl4afbWty079i8C5XakjW5a3R+vG8ikE88bhv30OVNaxRqPdREOfNA1pJGM2ryLcLWmeSXjiln7S+YcqQjMPMSv6Ik38TLFlJUS/ajGLuzF6VDTbCrV8Nf4IekDH4OAB2uFTVmBkMIwvfji+tumx5jHVfxboC3EHUs0It8HD1FP8GM9PQ7CFUyV42K8njnMuzdficmvP3dYcFq7psfhIw2xZ+liDKEcaYeBeJZ0FX6MOJg9+TE021BmKJ1fXosZpgQUDwufVesA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=altera.com; dmarc=pass action=none header.from=altera.com;
 dkim=pass header.d=altera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=altera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dPK7I2LT5n0ok0gTQxFoVcsOJ32jCSrYKBelLufnswk=;
 b=cAGURh44aDMvyuCDuyHJ+mc8HD/T79DfpMrj6DMPK2Wr/Q0dBw9KONeNJ9/mEFRquXFAZ3rz1fkF64F95pmX8IQaSVIOFEOlwbmb+iuiDCwAVsHFI5ZIjnz19TflVnBPikhyC3818qVP4GniSHN1ZOrvSKYGufWDhV43GlWGfhc5wcqbCkYe8eIcnzTpCyCEgO70TU7oYtw6VgG7uOqjVUl3hw2eRvpM4QhLJIOnUghN9uL6xnJZH0I9JoUC94Bnz7Fd2H3bq+2zVzDZnJ/EJvE98FEm/JRAdPHVGWeNmwE0vn2FpXXeus+ulfRvOh8PeOVa97Aiq1mTqAh2IMHzPg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=altera.com;
Received: from DM8PR03MB6230.namprd03.prod.outlook.com (2603:10b6:8:3c::13) by
 PH7PR03MB7509.namprd03.prod.outlook.com (2603:10b6:510:2f1::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.16; Tue, 4 Nov
 2025 07:31:31 +0000
Received: from DM8PR03MB6230.namprd03.prod.outlook.com
 ([fe80::abad:9d80:7a13:9542]) by DM8PR03MB6230.namprd03.prod.outlook.com
 ([fe80::abad:9d80:7a13:9542%3]) with mapi id 15.20.9275.013; Tue, 4 Nov 2025
 07:31:31 +0000
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
Subject: [PATCH v5 2/3] arm64: dts: intel: agilex5: Add Altera compatible for I3C controllers
Date: Tue,  4 Nov 2025 15:29:07 +0800
Message-ID: <ac9eb45581525f1f3aaffa46a73927038ea8a9ae.1762237922.git.adrianhoyin.ng@altera.com>
X-Mailer: git-send-email 2.49.GIT
In-Reply-To: <cover.1762237922.git.adrianhoyin.ng@altera.com>
References: <cover.1762237922.git.adrianhoyin.ng@altera.com>
X-ClientProxiedBy: KU2P306CA0016.MYSP306.PROD.OUTLOOK.COM
 (2603:1096:d10:3b::14) To DM8PR03MB6230.namprd03.prod.outlook.com
 (2603:10b6:8:3c::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM8PR03MB6230:EE_|PH7PR03MB7509:EE_
X-MS-Office365-Filtering-Correlation-Id: db0e793f-2c2a-4df9-a57d-08de1b742c77
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|7416014|1800799024|921020;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?07Y0GaHTerqVDg4l4Q4EG5LlG1CaVoPphXT2PBMP34J0cJISs4jiJjKHWDmT?=
 =?us-ascii?Q?JDveVKtI0STAX7fH5fVTc5rGs7jttDAoLR+bkJONRmle9pRgTAf7gAcynQl1?=
 =?us-ascii?Q?r3CQKZ/UquCslXsap0T9bib3Y66UuTb9aRHpzWcXzISKPCSu2ZOMkEyOfUEz?=
 =?us-ascii?Q?NfQXbyqgB/TIqZBaaK6HgcKoJzk4L9Pparncw+zFN9pb7Faz3X3U2mHuicHJ?=
 =?us-ascii?Q?GXAQb0LMf0//ipXajz63ey9yzyoZrXS4Frc4RA0+k0tKd74Cswqtdt+KYMva?=
 =?us-ascii?Q?snqBi+n+sSb3AnGHiula4vuEMPUcG4ACIfVhtHFYTy5pufTL2JtSxRk5lkr7?=
 =?us-ascii?Q?duB6LeQ2T6LUOKF0QEDIVgPWg7PIVgevsw/X9BLbnt3bz1r8QWQrZEQZiT1r?=
 =?us-ascii?Q?ZI+q7uHy+CdALCmdrC9OsQlRt3L+k+qo1hzo7QwaQR+j9edpIBbSntAX9UEC?=
 =?us-ascii?Q?5ur3NfbrOebXwZPsb2sdQWpyPsGFz8umgcf8+2DAdRXBs7ZF1BDbs5PtApDj?=
 =?us-ascii?Q?8P/5RG7gYibrbGC3Q8IqFdyPPQ9HQ8InRK5ZnvYxSCxhdAorqofNAOvth65l?=
 =?us-ascii?Q?HDoqlBCVRVWAJV0EHpTrKjKn6VuRUD+IRf06qMCuYTHzd58Xfiu3sL9TM3yo?=
 =?us-ascii?Q?RAmuvwOfY+OW3inHdKZGeADEqVPF95+5BkY4Uz5zI7ZSVEKfAxywc+0Ryvuf?=
 =?us-ascii?Q?V3/xGFxnDE1h3++w9tomnqy6K51mXlHczq9MieFl2+gPAaH8XKp/4L+LlfSf?=
 =?us-ascii?Q?sIoZHfmx+J2d44CNdKEDw/4dBcJfbiE/43FOv5Z2cFmPSnvHqUiIzYA37jUw?=
 =?us-ascii?Q?iHfpyn9vdRlkLmyt7uUQ7I/4CeEJR9tSCKQDjvSgKwQIiYaTP6ZR6SFfA14m?=
 =?us-ascii?Q?CG3o292OZv64/Q3GAbbuyDw3IW1GDBtfZcylT68Q1uZg7z0k/f67zMWnYt/U?=
 =?us-ascii?Q?zaE8IU5o9Sbt2jdRMkVIrT3fh/ycvz0Xe5rZpI/s8gHGEXxEP3GD6e0n49ZS?=
 =?us-ascii?Q?1Lt0FK5hft2VLn+RAKcu3ROsi4L8c7dVeWrhONeQAzFek7uVzoYj8qNMQvYo?=
 =?us-ascii?Q?Ivc0T5hMsE5k1yoPkVgbH7IouekTSKurMpPYNpTa2oJznazIG5Zwb/m6QuWf?=
 =?us-ascii?Q?D6ScJ5jvzpQ8n+hmDqkh1bpuyUnNKZ0bfGsGF8H/t+FenbZZz6zYkRzebhzz?=
 =?us-ascii?Q?TPmLErpPQsHHIPZDcakJye2l+2UXrNa+JJS3RmG2+ACRVVCvWsu/AAvRY7sF?=
 =?us-ascii?Q?ToQZ5z2JMDHdRrbeez/T2xzIGv3/yC8JVeNnLy1Gf920X1S0H3zQOUaPq6f0?=
 =?us-ascii?Q?bc+aJ0nBcwpXGyeSkCOZzy89be5OG97bI2xdfZSKozY1wtAb8lbfRy7G2GS7?=
 =?us-ascii?Q?FZ2E2iMmxzOhr7VYL/F/uB1+2nDGEuCxChDvBGWNVuPC8cPCF8s7Rjqs23gQ?=
 =?us-ascii?Q?Fbe1wm7oIjHz0GS6Y5uifRsYZH0/KpLxvVo5sRmxKvBvPu75yWT3suzyd9tF?=
 =?us-ascii?Q?bX1M+V4ww2Bxey8=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM8PR03MB6230.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?QKY0qJac3zRbN0cJrgIrswfRkFXAbwoMGw6Z8co5XDSE28CtwEcERmLt1S38?=
 =?us-ascii?Q?edB+Eo44sN9u2p5pPsGfAnkeOpg7DICi7v17wObQ8rnwH54JRaED89C3+UKO?=
 =?us-ascii?Q?tmcFCNMeKiv6MhpXoHSF5a4CpipNCFBy7NcX0XHR0Eu3dDAeC3HAlazKjFBC?=
 =?us-ascii?Q?Ye8h8ewRGjwzgdN2e92HnuvhCn74WLep+D0dYB5Q4IO0j5VJMP+4ga4rQ62P?=
 =?us-ascii?Q?CrUU9aleBXHMspFO+9C8KZ1tdJ6CpBbBSC3UjTNF9G57pVBg8zO/mKhujgj4?=
 =?us-ascii?Q?Er7cvwCfY3Ap1zFSOUOnaKp/B3PkBtp/u9SKUCvtuEAkeBOpn4cWRYX4ObDQ?=
 =?us-ascii?Q?oMcroslJ/i4E9lGN9quW9kMNP1cI6eRAbmqqoqNYzSSCIg6zKrWkHyd2Xwpq?=
 =?us-ascii?Q?b64UuQ6S7Jr7IrA9cchKtonlGBMmL9W1dmIcgQ1A1ZeldnXYHok958v8Lim9?=
 =?us-ascii?Q?T4rNOH//YYJ3e8OUDZd5pCnQ+XFtCa4GWgpVIJNPYe1N87Xmyns+rWXu5zOk?=
 =?us-ascii?Q?4nihSoi4v7uwRrvaD67oDEkXp4kx+GJxG7IfzEG5R2K2Wrc9pKO/OXO/M5yW?=
 =?us-ascii?Q?UHYURk5CwNj8U+bRAAvk48vItJ0NYtUwP+h+iGy7tXCIR8Y6Bk78YDbwAykC?=
 =?us-ascii?Q?cWKPyWDxAqWvaKE71MAZFABjfADqZZhRv7JZEFkCpVF9zFyes+Z8CxUGxv4Q?=
 =?us-ascii?Q?sI52t0YgjOS1tyfDfo6r6PHEZxlJJ5GPZKAVzvRiUMZfHre0JsZHjEI/LT+W?=
 =?us-ascii?Q?hjpCrFGUdSsb0sBeu8HWoeDrTZoKkWCLtLc69KDEyneoHdKaLv5DifRj1EiU?=
 =?us-ascii?Q?hclR7dgPZJdvGdKe6+sSfsbgQvTagHTYbVwtPOQBp19taYwboQM5p4Hv9w9C?=
 =?us-ascii?Q?99UCliB9xJsJtuT1zxf0fArjFrtSgMJd88PCdFgch8mVzeRss6gin6ww87xP?=
 =?us-ascii?Q?ap5c28jpE6OIJ6pj6bv/2sOIEI5H+UGbsGR6f+j/G8/ei7nVor6YV+UWaDmA?=
 =?us-ascii?Q?IOTgoyK4OvLSeNC/L2cUMi4qYNJ04qlkY9fbvByQz94sxQHDSaJ6AW3k8zEW?=
 =?us-ascii?Q?iPkETcBMgxBedObki8cvc0Vh4/1BcKWJ0MnBxPCWfs1WouAkOpgX/3ChXYFW?=
 =?us-ascii?Q?gwU8Dkjwy9iYa0OyD73fop1HXEopGYFhRNJ//WL777qEsX/vCSiIwM+VX2Zr?=
 =?us-ascii?Q?/jz+4gcrh5sBKC93247NwlszMPed1hc4Zo0g2KMZ+DZVpt5I86cfaBTS2xGP?=
 =?us-ascii?Q?Yr+NQuDV9VT0xDoWpKtn/1NxvK1+Nld8q+VGW5C6HHQqQ8WNeQXsE3ax9ywD?=
 =?us-ascii?Q?fkyYO6o0MRHMFij57aAC3BpuZ3ARln4EdiUvQg6Lqdam7Mjnhk/aMEds3Ngz?=
 =?us-ascii?Q?F2XWaB1n0+reiev6xQxmWMW4567wb2VEWwEwZ5nlxBWMdydMe4VPz13rBX0r?=
 =?us-ascii?Q?DPsPfCRPaFSzPzMg3qe5MRvLruRdAfNv4pbTgAQFFKYTMdj8dQW34qHhVUMm?=
 =?us-ascii?Q?Ro63TqgaU04MkhdYm3X3yMNp5kl7bVL8tFNTmy1mUcr98kGLU16lvYc7LHTg?=
 =?us-ascii?Q?qYnmNQtYHmQ8IGim5u/Z49z89/gcIgYtZ4/VvfULDEi1Fc4DEsUNl5sGgvXm?=
 =?us-ascii?Q?0w=3D=3D?=
X-OriginatorOrg: altera.com
X-MS-Exchange-CrossTenant-Network-Message-Id: db0e793f-2c2a-4df9-a57d-08de1b742c77
X-MS-Exchange-CrossTenant-AuthSource: DM8PR03MB6230.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2025 07:31:31.2847
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fbd72e03-d4a5-4110-adce-614d51f2077a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UffaLTjUdsPdXz/e5BSnDAgQ81R4vyrfv+iqwwC9fVHFSyAAGbb2ETy5xDOULOsWDRVdNKIRSnOyqA6wJT/VrwOBWrHqNf0jaDygiU2KpwU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR03MB7509
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251103_233136_010867_B890DF33 
X-CRM114-Status: UNSURE (   8.29  )
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

Add the "altr,agilex5-dw-i3c-master" compatible string to the
I3C controller nodes on the Agilex5 SoCFPGA platform.

Signed-off-by: Adrian Ng Ho Yin <adrianhoyin.ng@altera.com>
---
 arch/arm64/boot/dts/intel/socfpga_agilex5.dtsi | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/intel/socfpga_agilex5.dtsi b/arch/arm64/boot/dts/intel/socfpga_agilex5.dtsi
index 04e99cd7e74b..5c8ad5e9b248 100644
--- a/arch/arm64/boot/dts/intel/socfpga_agilex5.dtsi
+++ b/arch/arm64/boot/dts/intel/socfpga_agilex5.dtsi
@@ -203,7 +203,8 @@ i2c4: i2c@10c02c00 {
 		};
 
 		i3c0: i3c@10da0000 {
-			compatible = "snps,dw-i3c-master-1.00a";
+			compatible = "altr,agilex5-dw-i3c-master",
+				     "snps,dw-i3c-master-1.00a";
 			reg = <0x10da0000 0x1000>;
 			#address-cells = <3>;
 			#size-cells = <0>;
@@ -213,7 +214,8 @@ i3c0: i3c@10da0000 {
 		};
 
 		i3c1: i3c@10da1000 {
-			compatible = "snps,dw-i3c-master-1.00a";
+			compatible = "altr,agilex5-dw-i3c-master",
+				     "snps,dw-i3c-master-1.00a";
 			reg = <0x10da1000 0x1000>;
 			#address-cells = <3>;
 			#size-cells = <0>;
-- 
2.49.GIT


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
