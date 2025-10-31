Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E566CCFA02
	for <linux-i3c@archiver.kernel.org>; Fri, 31 Oct 2025 09:08:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fw3alDHNsrofLzIwWvfsR5HaPHxocUf9ojJf2DJQ+N0=; b=fbdLIbFhPmyCpv
	GR1gC4jaoBZuQq0HgbYmO6ztg3gZ8kRUDX7Bqk4F8VHWEoj10U50mR20IQbcub2nACsqvCfWJ++RP
	EQzPyOp81D4wDiQXnssJQf/CMSSHguhXDR3QTob7IdKFbOJMsKc5ocTEb5Fxd+4Oqbzr6SskFHmaY
	yovQqpgWMYkilNkgk66fqjFLUUdzyDjIFsr6BGL8oFKlpojLL/aA8Yg75njIAxuJu4V0xsJrwOL8R
	mffpXlY6yPtcGAIUWQgP/BpmvHBdqqQTtB+FAJlIHMbfqHKZ1/brKbgu1qp13Eh9XahVhHL8IwmA+
	EMjb45LutUE2MAopO76g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEl7V-00000005l3V-0yVu;
	Fri, 31 Oct 2025 09:08:29 +0000
Received: from mail-southcentralusazon11011005.outbound.protection.outlook.com ([40.93.194.5] helo=SN4PR0501CU005.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEl7T-00000005l1F-0aFP
	for linux-i3c@lists.infradead.org;
	Fri, 31 Oct 2025 09:08:28 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Uas6i2iLiDV6FzQvQc5xuOTUEnt+PGE3uEPzIxFHIfnqXGMzIQqLXxIaMTmXHSKvTnUI3aV2bKHz1Ye1vaT5MnbdBxSfiQAyhMXQxytcREEjEEOUAChAEMT/No+i9jSV3DybaoSXePNWNRb9g8N/EI7LnyNCMdIKyZXUokl3MkzFqvURQ9PyOQWWTuaoDtqX0bvpx4ezaQYTYR7u+kzm/2w8LGi+592mxzwUuERZHvHJACuC1UC5lpjnomV3XJw3vd24wrBbIkCuFz78Hop19M/tNr3RCdMDyBaiLD8yEVK4LGqurSNmNK7/cKpNAi3xugpvl0o06Sw9ey6ClAWnZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fW20IMGc06t2TNnEqY30bxwGRW8esdcFKqFNsx7vCm4=;
 b=hUMKJCzoGDIevw6CC9egSlwvNjq18nXotk8DOVYwLjufIDGdoktmaFvWtehGguuGyIZi5lExokX6Vh4VPimTsYo6OfavI/WhPcrMZe4s0qQ1PDK2Sxh5rCOIoE12E1xMuh9u2ewLAOtJkBF4nq2BD51284O6Ml9dhHeuSvxImYQN3B8xEjXQMwGoPMuG6/RkSKpxWVsjRA5Y4Zda+u1imRHS6zND9bCREpIVUsmssqZcy/2IJpjw86fR7brf7dxbbqlANWRpt7/xv8Ic/ai2vEyAwGx73Jw0QX9LCqm5fmER+OJvIaKh3iwBE76x2PY92B+NKw2EdGn4H1j5Qo28nA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=altera.com; dmarc=pass action=none header.from=altera.com;
 dkim=pass header.d=altera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=altera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fW20IMGc06t2TNnEqY30bxwGRW8esdcFKqFNsx7vCm4=;
 b=svDSW84aaWEuNVPiQOF6+zL9x8ABluIXXw5bTDmUlLmpSyI7yhcI2R413jdejp17sMO4qbU4VrcyFO52GXqtwo/ilHyXgQiovswUEAcN2TVrTDPhKN7haqolpp94vghi9MWmN09anRiTDFAqfJqn8TbG/489rRA31kbcOQpXM/kKfTwBrKCOFcC8v0UCt3h2qkCPKDyRfnD5EB/uo7ddHiRqPKfpxz15JUeoRo2NyIFKZ3V9RySlsQWIi/bZzDKA5Qt7maCdV8APdWDd5EREUEoXyNQU2DuS+VEBHjOwgRTJEq73c5Hvz3cDBIm7JkdWXnTRjx8X4HHrpxF90yzU9g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=altera.com;
Received: from PH0PR03MB6235.namprd03.prod.outlook.com (2603:10b6:510:ed::16)
 by CH2PR03MB5269.namprd03.prod.outlook.com (2603:10b6:610:90::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.15; Fri, 31 Oct
 2025 09:08:23 +0000
Received: from PH0PR03MB6235.namprd03.prod.outlook.com
 ([fe80::24d3:54df:52d0:1030]) by PH0PR03MB6235.namprd03.prod.outlook.com
 ([fe80::24d3:54df:52d0:1030%6]) with mapi id 15.20.9275.013; Fri, 31 Oct 2025
 09:08:23 +0000
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
Subject: [PATCH v3 2/3] arm64: dts: intel: agilex5: Add Altera compatible for I3C controllers
Date: Fri, 31 Oct 2025 17:05:57 +0800
Message-ID: <f1a8b8265fc2b0fc7d89023f91a74bf048639751.1761901158.git.adrianhoyin.ng@altera.com>
X-Mailer: git-send-email 2.49.GIT
In-Reply-To: <cover.1761901158.git.adrianhoyin.ng@altera.com>
References: <cover.1761901158.git.adrianhoyin.ng@altera.com>
X-ClientProxiedBy: SJ0PR13CA0066.namprd13.prod.outlook.com
 (2603:10b6:a03:2c4::11) To PH0PR03MB6235.namprd03.prod.outlook.com
 (2603:10b6:510:ed::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR03MB6235:EE_|CH2PR03MB5269:EE_
X-MS-Office365-Filtering-Correlation-Id: 60f132cd-9149-48b8-da5a-08de185d0af1
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|1800799024|366016|921020;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?4WWbQa2xP0dPPg2cj1kxOucuyeK14q+YiZsK/HJNNRFZZmmxuys9mb44gNc8?=
 =?us-ascii?Q?62gzuszeGLj+D4N7KiwaU05USrGtBEg9e1q/iZUC+G1PkWriJD8zIi9V/5Ra?=
 =?us-ascii?Q?Km2FSGbDmR9fsYCbXvUEvWqfDVrvyurTWBDE469vXaJn0LFL53rN6OEDK+T9?=
 =?us-ascii?Q?6Ek5ToUSf86KJS3hEy053HqxX+lR+bzUVm/YJ3XL6UQJx0BY6s/4VzGH6/1g?=
 =?us-ascii?Q?oOESCjrjR+pwiepBsRTsqoRjK3LX3svyULdCS4HkB0t8Yq0VkNf7Cu9LvpgO?=
 =?us-ascii?Q?ZEg3zXznK4C2TE0g5P95rJYklaXMZI6fq92IZQFIhLI63w6SpJfrZcQvN1BJ?=
 =?us-ascii?Q?63iTXawBg67DbbqZanTRDvhIffxQKcGECuvibrnxT97vRXe5X3MHZSsEl8aq?=
 =?us-ascii?Q?rnCJGMmXyT1DMF4mwEIRl9hqh06dhfZoQZbQB3LC7ZFVG7kVi+8NmjL5DwII?=
 =?us-ascii?Q?mCxqdQ0TS/NiK5IC5SBL5pEoMchjlpcqKDtCGy5r0aIJ4pv54fj66p/z206U?=
 =?us-ascii?Q?H9ROVXr46eDGNXQkauUsk0gokESKnI26Teknn0onJBgAyhttayjqZTNKVJuG?=
 =?us-ascii?Q?B99TOlYCRukg54Q/NWumnHKaPhkjXjwdDMK2vBcuAelKGuLRHUdOR6RX3AjR?=
 =?us-ascii?Q?a1dydk1RAqfJo4HD6dJbAFjMaIlegKtVOjL5D4ZDB1/gSCtq/hHvu0BNDSHb?=
 =?us-ascii?Q?Z4HTwzLco/VgyeU5Ci+sACRqWzsbHbb0h2/mPQFk8tvdF6K9TwZjZ9VJj1dy?=
 =?us-ascii?Q?qpRIxF+vPsnPCusTbZ6azRUst+PWwMkQYOXjgIBk2vO7+0gZEDyI1dIxphhI?=
 =?us-ascii?Q?Funs9zDFF2sdtU7WrFsRQFX/MNjrM5jUbidCtrAvL2phtqNn1+4iyU10H4zz?=
 =?us-ascii?Q?hBtQ6fKlfypSwZPEbn4MS+ZZ39WzHzT+wUCbjSGQ59TDVu3NUNXPmUFKWn/K?=
 =?us-ascii?Q?pvTz87PFYOpzItEYtuEi190ValTgMSh224lScPVWx4FxT5+j65gL9ppR9ZgJ?=
 =?us-ascii?Q?lsThVoPaGJs3s+NHydc79lsWVMlDwOwsi3V+0xctGuwv820wYpZESfpFYQ7Z?=
 =?us-ascii?Q?SPcQBfpMhnORFamG/HaNh2cAOuonbuNzKk4tA6LJ+tYBi4w+K/bCr1uL3pS2?=
 =?us-ascii?Q?MBsS6cKbRUaQuoMHqZalWtX4Z5gv7/EUFYZ2t1tJUmrdkecil7JCNcyQlltQ?=
 =?us-ascii?Q?ORgv51XiM3ZodKssPOutZ8S+X+GhmcSApgDpAdG307DyEYhMB9e/0M7X6Fmd?=
 =?us-ascii?Q?4D4Mn8djXAcqTPkOgN9Z1ZwENGVZ/eKHTjEyj0ynWSJxlpEFHvwXB3WgzRoM?=
 =?us-ascii?Q?/lyAsz4RFT18BwHNlXLLyp8LY1cR6uYC6zE5SICDh7UgnPOQGobZyJlOJMCU?=
 =?us-ascii?Q?fYRwUbzKDf/redFLtforimvkmsVkBMlGeBEm5d3AaalPpz/BfQfyMKU+hfgX?=
 =?us-ascii?Q?Qqg1kFSdMNsGGuAYEfwDEI0ogpB1lrNsKMdNXKSHrYX6PVVF5U6gq+LtoLp/?=
 =?us-ascii?Q?7xSsSsbly+/m92I=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR03MB6235.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?MfDiNwV9OvmVB/W5YOBqZfueJ+/Apuen84cK6jzqjZ96AMQeHwDAO2rUm7nx?=
 =?us-ascii?Q?oeHjdgNkz+rG3Zkqo3D+EwWOUGhGElpTuWgax1Nchb7XoGlPDek4pWsqdWGY?=
 =?us-ascii?Q?vlWBGUWYJgCgtFD9uQ56rnBZmEQAEuVKA40wDvaLmwC09Y4UAvAYNyckoaeS?=
 =?us-ascii?Q?aEd+fWqT8mfbCGgABigpfl9TIra8baZXIdgUdyz7ASel8FbMWweTou7P9prB?=
 =?us-ascii?Q?xUUG6qT1VCVJ5eyt1SKPQFZ4hWYLikpEl0aVm/hK58kgsDScIwun/JJxYDhV?=
 =?us-ascii?Q?9R6cWXohNWOylqQB8narOgompdpclAC+1OJ73ifLW67wxktyc+5LmpOSXRoy?=
 =?us-ascii?Q?UDE2Q3UqszdbVr2oLbdw9dGaNPdGzsdLpNZmZFtS+vnW/G9t/SHDak1cRYXl?=
 =?us-ascii?Q?TopoBbJqJAPkxZ6OLd0/6xt3wlYofq66vngjnFKmlEciBPqxCKW/XfVZ/WUD?=
 =?us-ascii?Q?CrX2MOfYNo1xmerRhuJgfwyVdH5NMgB5m23M8nzyDzjAM4zDJ77Be2Erc3MO?=
 =?us-ascii?Q?WD+EwgUJSo8oaGWrcmtC6YpJt+4BIp//1lD5G87sYYiO5HvnX4AbQyOELwHc?=
 =?us-ascii?Q?XJBNUOxjUp0BOlcwCD6rIxBVn/ktiAOi/tKBPNkoMK7pLcGVegtmcDHpwZ2S?=
 =?us-ascii?Q?DZz5whj65avQbwkA10BLNsebALHdmBLBRqrfs5tPyCEccC40zRXXzdAMlE7m?=
 =?us-ascii?Q?bEQNh7mA4X0TFIcyIop/UPH9jo8XqS5QB5EH9IWfj4ogpsFAlMZ4HgN1nfte?=
 =?us-ascii?Q?JzwW4lb46yFjvFrGyPEA+GVvu8yvCgIC53eXcVqOk26hmQifF78qvHFLZutF?=
 =?us-ascii?Q?2X2RUHQSHfEoT0OMoKxMQtbnK+trCRmySrr2NI3VBiQSstTzmh83FF3RapIl?=
 =?us-ascii?Q?OMHKa+u5HcDL+LYB0PpVthft3JMGZ04K5P1sspRMj2Py6fLOnvVGjo4PFPmR?=
 =?us-ascii?Q?6byOGV5lFg6mXBK2WVJ+UWXSXbrXoqircClS91dvuWJoDfX8g5OJgUdADpFT?=
 =?us-ascii?Q?Xpw0w0OSd5HQJtOESB+t8KJ5eu9A6LbvGO9CY0dUVpxA/MyIHM6z9RlJ7SMO?=
 =?us-ascii?Q?Lvkp7gwWx05kJ2cBq4ykG2g5byxbaKCpT2OPPurnI9UZKolGuKiYAD4Vz9Lv?=
 =?us-ascii?Q?wDJs46wlxQS2vI+xqhCUUhv4Uz5TJDC2ZBAjllKj2j4fg23br3zSZBDxLLhR?=
 =?us-ascii?Q?A2Fdqm7TUtYTTP1PbXPQkhXIS7NlIuahMAANiFhv4K+/5+V5riZtm6PjA1ke?=
 =?us-ascii?Q?L1l7zgVoldkQWpOG66jk7cNIAShLARGKg0ljOZKGN1hEyPmgr9D1f6I9Mx+Q?=
 =?us-ascii?Q?qtB2pZEn5QeG69RvgW+yrLemAk0j9NI2uA2qNhv/E4xK0xhYm2jrvhoRZXHv?=
 =?us-ascii?Q?76zdU68Jv+e47Z81G0EXQzJa6O73DtSt02E6L5ySEKT7PACYLR2O8KTKBtpP?=
 =?us-ascii?Q?Ksk7m5yEBLp7Idriwy3+9Qy6GlMIDZAlIVhX90YXYsKJaNlzl1idZnAUSR2Q?=
 =?us-ascii?Q?Chh02WIdL4o1X7qP72KStk/vYv2yIjHGN6pM+kxfcMswy6gUFJ66KYw1X9Rh?=
 =?us-ascii?Q?FdH8LSt/fvj6oVeeCOk0K2URx7Q8ra+LqZG/OCBz/oZfiqmv+AmUk0LH4feV?=
 =?us-ascii?Q?ag=3D=3D?=
X-OriginatorOrg: altera.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 60f132cd-9149-48b8-da5a-08de185d0af1
X-MS-Exchange-CrossTenant-AuthSource: PH0PR03MB6235.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Oct 2025 09:08:23.1754
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fbd72e03-d4a5-4110-adce-614d51f2077a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4mjzFTmvKVuU1rUSgHst5NYUf+CWnpwicD19PhVVvgsyr4LNZUUAp/KIN/v1Zu06DmXsKvDwVFssA11hr97y7uiQU6o6HGNpSI4KzcmiXTk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR03MB5269
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251031_020827_203613_440D2313 
X-CRM114-Status: UNSURE (   8.37  )
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
I3C controller nodes on the Agilex5 SoCFPGA platform. This allows
the platform to use the generic Synopsys DW I3C master driver while
enabling platform-specific quirks or configurations associated with
Altera SoCFPGA devices.

Signed-off-by: Adrian Ng Ho Yin <adrianhoyin.ng@altera.com>
---
 arch/arm64/boot/dts/intel/socfpga_agilex5.dtsi | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/intel/socfpga_agilex5.dtsi b/arch/arm64/boot/dts/intel/socfpga_agilex5.dtsi
index 04e99cd7e74b..c494b3bbb5e9 100644
--- a/arch/arm64/boot/dts/intel/socfpga_agilex5.dtsi
+++ b/arch/arm64/boot/dts/intel/socfpga_agilex5.dtsi
@@ -203,7 +203,8 @@ i2c4: i2c@10c02c00 {
 		};
 
 		i3c0: i3c@10da0000 {
-			compatible = "snps,dw-i3c-master-1.00a";
+			compatible = "altr,agilex5-dw-i3c-master",
+						"snps,dw-i3c-master-1.00a";
 			reg = <0x10da0000 0x1000>;
 			#address-cells = <3>;
 			#size-cells = <0>;
@@ -213,7 +214,8 @@ i3c0: i3c@10da0000 {
 		};
 
 		i3c1: i3c@10da1000 {
-			compatible = "snps,dw-i3c-master-1.00a";
+			compatible = "altr,agilex5-dw-i3c-master",
+						"snps,dw-i3c-master-1.00a";
 			reg = <0x10da1000 0x1000>;
 			#address-cells = <3>;
 			#size-cells = <0>;
-- 
2.49.GIT


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
