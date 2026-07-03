Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1008BC44500
	for <linux-i3c@archiver.kernel.org>; Fri,  3 Jul 2026 10:51:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qonJdAiSEiM1YL/0hMn0ytOYqBkftNVqO1Vhpv/3a0w=; b=SFmXadxk1mj0xK
	b6R6BtdyGjy37URx7sMF95M5e1iTl2EZYre5VtH2ww2gxLZAcA2jKqhQCAOJ/Pjo+wf48T8Cq8Ar6
	BcKqAQFc12F4k+GwFCHT8VpImgrutt+AwS9CIQNcTB81sBRi8j65/M8yIL4brvCwmWcwlPHN8q1Ol
	+dFTgEopmFlCShs5KL/6EVP2P+ilwYfEQf3pCWFvyhBK2z/M/ttIsm2eLcK9yrdQhVK493mFXoRM8
	tob0pNt3RUj3jHeSG0arMpS1c/wucBymk8agoc5Svb47Ojrr4f1Ba6EpQ76fQHVHVQDfZiA19kyzO
	Aq7fnscN+IVq1iJFG9+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfbUg-00000006iwP-3NOe;
	Fri, 03 Jul 2026 10:51:38 +0000
Received: from mail-westus2azon11010034.outbound.protection.outlook.com ([52.101.46.34] helo=CO1PR03CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfbUe-00000006isM-044I
	for linux-i3c@lists.infradead.org;
	Fri, 03 Jul 2026 10:51:37 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UZO5nzlo/oPWPSDH+9r0WsGY76ofLN+u49QJlhlrDDPzx9fs93P02MTyM+ZLKGCqXz0jxgH37kZ4QZQNtbTX5TKr5aqLCFqvZpiZrGXtla07bK6vK/ds+k+HpnSl6/fUwqEEe2mm9gnMhMfU7DJXo3etIAAFM2lRMg9wiLIICOre+8EYosN+ibGhHKhF6S+UetKeoIDaC248ttsBfrcopD92+gWwXF0ZO1DIPaY9ZYT5hwnkptcnP9xbjensOkGJy0mLIVIccz4+YMvnNrSyKC1/KpuGGDiz8+PA+8nHLevuEnLs760R89qdsVg5zecMCIXClWHDphrObRMtKnohug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9OLM96QD6PGQrmRBOj7eit3//wiBb1w510Qthe/vR9I=;
 b=VWyy0TUH/afBNq1/gOveZr8EaBAxntuyNG9ewPY8FXw8CF21vyyDmO/S8rxHGtFejX0l2Tx1Q6u7l3qXHM/3tghSSBUio3MkdWp+n7CiVBSyrvDv9SMGelQ8RfHsA4DRRTFoQZQ9xqu0wfUNPGxpNMIC27nUVKKeInW7mtFHdl7S71VVnNG8Hs90FZx5ONYaK/eorW+dKe9aV98k5c3YlN/w37h4Gvfo37v0ExpfmPF3qGV867HRinkyie9YfpwZrbNbGP+esUKCBQKQoJ9AAochRsQ7ueMGKo8oxNAxwYxd3Q7PKPCHIJNXFXweaEweZTjQw+dD5z+4dF7J4LtO+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=altera.com; dmarc=pass action=none header.from=altera.com;
 dkim=pass header.d=altera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=altera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9OLM96QD6PGQrmRBOj7eit3//wiBb1w510Qthe/vR9I=;
 b=S5ZWL50YhEIU8/YmqbC0BlEvYh2Xhg1aCuuBL0t3MFQC9HHbHCBaNfsAP3bcZpaJOM92LAielvEc5z7KMYhzV4eG153Y1QWwxgMGjnN3+zgtqd2hn4w/qE9ivb11DvZ+N9eI2zi8yNUnZqs8KbNFEyCLzINoMVfwqg/tpj4U0GK7EZNLL/NVFooHAxrZfLceggz38hXNOQuvoAH9EZOiE5jrQzNaoj2U56amkIecZDIvS9ncvBkI3cEDo7kt1BoMNLLL5U8sZAfbGNHZ2oPuonX3oikedfoLgspbWVIvKB/fMBW7bNAbuAM4N36dkWI0JRYzMmoAiqGeA8ClVtxaRA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=altera.com;
Received: from SJ0PR03MB5950.namprd03.prod.outlook.com (2603:10b6:a03:2d3::20)
 by DS0PR03MB7631.namprd03.prod.outlook.com (2603:10b6:8:202::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.10; Fri, 3 Jul
 2026 10:51:29 +0000
Received: from SJ0PR03MB5950.namprd03.prod.outlook.com
 ([fe80::53a0:bf93:6b6b:de01]) by SJ0PR03MB5950.namprd03.prod.outlook.com
 ([fe80::53a0:bf93:6b6b:de01%5]) with mapi id 15.21.0181.010; Fri, 3 Jul 2026
 10:51:29 +0000
From: tze.yee.ng@altera.com
To: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Frank Li <Frank.Li@nxp.com>,
	linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Jorge Marques <jorge.marques@analog.com>,
	=?UTF-8?q?Przemys=C5=82aw=20Gaj?= <pgaj@cadence.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Adrian Ng Ho Yin <adrian.ho.yin.ng@altera.com>,
	Felix Gu <ustc.gu@gmail.com>,
	Manikanta Guntupalli <manikanta.guntupalli@amd.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Adrian Hunter <adrian.hunter@intel.com>,
	Jarkko Nikula <jarkko.nikula@linux.intel.com>,
	imx@lists.linux.dev
Subject: [PATCH v5 3/5] i3c: master: dw: Map CCC hardware errors to I3C M0/M2
Date: Fri,  3 Jul 2026 03:51:15 -0700
Message-ID: <7b85402977d59f7f3d28f15fa7005bbfafffbe20.1783074850.git.tze.yee.ng@altera.com>
X-Mailer: git-send-email 2.43.7
In-Reply-To: <cover.1783074850.git.tze.yee.ng@altera.com>
References: <cover.1783074850.git.tze.yee.ng@altera.com>
X-ClientProxiedBy: BY5PR04CA0024.namprd04.prod.outlook.com
 (2603:10b6:a03:1d0::34) To SJ0PR03MB5950.namprd03.prod.outlook.com
 (2603:10b6:a03:2d3::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB5950:EE_|DS0PR03MB7631:EE_
X-MS-Office365-Filtering-Correlation-Id: 3df039ce-6e81-4209-0b46-08ded8f10650
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|23010399003|7416014|376014|55112099003|18002099003|22082099003|11063799006|56012099006|921020;
X-Microsoft-Antispam-Message-Info: yHHA79CUbf2UqLVN7VCo4WUEUkR19s63PGjyWyQFNPiwxrYFUnbQlITRfiAPHoN/AYJ00Acjn6yY1H9dJfv6IdWFmbI/VX3Z+btXubsgeYTJHld4frL7Qvz1fvf97XW7dUkK1NQnjjEtk9AoaoVlBMXQtucwxC5iNv3zDyplr7dyciODDOaS+WSG5DmX3yUdv1D9jeznQUZXYSUgcFx5mLtaldVz17+P7ZdS/pwmjBxXDfygtEU0LtMONzLJ6ceCkRBLVBDYEoILO73/4llFx4xH2Q6myXG5E63ciya1InMmhsiBC23A+xqxZ8VfIBGEmahm+6KUhAtPL8pwQKzik73aG7hvdQaGn3XrqgYXDU+wjqxNY0SjoyPyiJcjME46iJLA/XSMyMSSjYNyPb8iNVzS0Ymskj//oEblL8xUPSL3OYUc59sQJRBojuunTKENYm6bjA3uTBfWMPI52H9Kw6Vj6v8r9yt96rGFR4zH0/SUDQcG2qpesuAorh5pB2fe/jpr5zAM39t7dZr8exFAiy7kBe5l+n2SfWM1g9IhjEioMI/g+utwc9w4C0oCZT7WYL3HKefu6ESuLs5nDRfzDJV3Ie7JFNgQopCZtfxBmAvEjQF9t4scKxYwCzSnY8y91rYPe/LgUDGBaLhR4zDW83YrVQK13tZu7Wx7oLrdZBtWfNCgSTqlOSMWMPCv7Sxr5/5VYa3CCUay7tD9n7Ulnw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB5950.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(23010399003)(7416014)(376014)(55112099003)(18002099003)(22082099003)(11063799006)(56012099006)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?N0QpE1XPHCqFKGqSFffbckSZ2CUUQqckTf7oyXIHh8jlsjRIgwJ14oUr4c+4?=
 =?us-ascii?Q?T69DeDpem5WgEiTZqA5ey6SPopB43/NftQ3Bqc4v6+pMIr7hqmA/z2U0ZxBF?=
 =?us-ascii?Q?zNZHjmZ2T9zLo4OPKp05l/mFusd+pIHejdD+TxtxFp12VZkCo4bxA8TGavQu?=
 =?us-ascii?Q?mwHurT9Dh8GXQkPmHKTpEEEGDAmXSq7rNO2kJFGcRJyaU77bDo0EVpotuJHs?=
 =?us-ascii?Q?tuIaCEz4EbvVR+/q26RZWyDnO46YivqOgZs3SiF1sQ459mHkh5FxXXGD6XQr?=
 =?us-ascii?Q?zguPiEIxXHmx4/0M1/MQLnNfOQMwKDFSqHxplentkjbisalX2KBPawPc09gR?=
 =?us-ascii?Q?8v/qMW7DCVazyir5zwKFxZxUM3DbEr67m3SCUeNx8PITDG1strUbvDxQRIM4?=
 =?us-ascii?Q?G3b2BayWBXDbw1/O2pzQD2RAZcvEQSxsLr3kEA7lZW5x1LofTmaV+3M3z4ll?=
 =?us-ascii?Q?ottBdwFMyx0UmwVuhtwzucX2nsY1srmTv3NoPtWgxB3/6p8JFYuPdXn/qdXv?=
 =?us-ascii?Q?i5Rji4jj0FhPl+TeFuBMJIM0JvgslsHJPUYIRgGTgKL9lGR1EJ0Ek89rjKi8?=
 =?us-ascii?Q?oNihS0ClVxZvln0H8TDLmIZkh9YGc+KPzzPKDo5QuCgHHXGWvMGs9KZl6KM3?=
 =?us-ascii?Q?lKivmMZATRJoLBrim3udqU59FnyxL/aNGqcrGeWRL8yZKNT4+y7HJtNawqw8?=
 =?us-ascii?Q?0Kq7U1tkJi4gRAxpndEBrZXj6Qshbx6HhXEYaUgWLOqV/uTQD8XdiE6UEGAF?=
 =?us-ascii?Q?/2SzdzfSZuPZxRqLiihs8hhuS5lPk0MPlCdRpEXxcYcdg1xSaraRKkOQ7ac9?=
 =?us-ascii?Q?wWmZjOBZLA02rjdNOawPi4WcVXlakzmnkihioryYLxKIFYfLTX03CYlsA2W8?=
 =?us-ascii?Q?171FXfDo7dIUJqcDi23aSl3jaR+L7WAJlRwO+9+mUkwlcimsmlsylIwzQfnq?=
 =?us-ascii?Q?jwLV9DaewUnOnd/qK0SQizO9kNCf3c+tfR7sCH6X4VOiymbZa6/K4GMiwvSe?=
 =?us-ascii?Q?bvLiCRxxug2n0LtWUD/YGRgEuWzeMHAJBbtWigmxBrZqXru9RnIojg6gLs5n?=
 =?us-ascii?Q?PRZZFeZTjMd3o5dQY6ZVIGJu+GuVsa8pFWfcxDnNddRl7uQwv+0CxDfkgfDV?=
 =?us-ascii?Q?qXCH8QewUjAWtm7nuKoMf2hR9px6iYLzVRokWt6PQxghIHElhoqDphEMJpx/?=
 =?us-ascii?Q?iAfgBMpBkFgbQpI8/W1T8j6QtppSK7uLlSTWa3AyeZavRZFzO4WD65LKQDfw?=
 =?us-ascii?Q?yVKVrCjAzLvqPuYS1LrEMtmgBp84QtOOyZJssq99fYLC5c1Y+yYpaUOjbQi0?=
 =?us-ascii?Q?KAGdE/TrHwGhzyShcyLKXDqJ3UC5WapWgU9+6kQaDhhRjNH4dz/1xHONJx6n?=
 =?us-ascii?Q?GJ5B74oZgrJU5uQ8YDGZRVly3JdedS3Zbw9mpjpevhELITSi58ItGLM0n/Ld?=
 =?us-ascii?Q?9WY875Cjs6iGXlxi1V1McQc4cxJb0YZ8p+IgKkIwmbK0ajHYJdPEVoQ+BBbi?=
 =?us-ascii?Q?hJ6NGjcZWa46K7T3xi6boRnLFJK7WIW5m3hVvDdc5eJdnM2LLsV9ZFtn9vEw?=
 =?us-ascii?Q?HfGE6N108hMeveG9pmmpOYLaZUGU9Qefj8zXz5tz8wrmEwE04Q7e6MTFJLJ0?=
 =?us-ascii?Q?5N3Dkz6XsELvAbY8FSk8FkZs9CCgYygnG+rldnszNFiS4cYjhfocr/c8GlpI?=
 =?us-ascii?Q?4LWvNnMaDsUhwH/b3EYSU6dVZnNV2E5+Nm0exdSG1M/hxl0+/mN+ZREV9jiT?=
 =?us-ascii?Q?fXyEiDz1RA=3D=3D?=
X-OriginatorOrg: altera.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3df039ce-6e81-4209-0b46-08ded8f10650
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB5950.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jul 2026 10:51:24.0433
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fbd72e03-d4a5-4110-adce-614d51f2077a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5H0q/DDlZuTUMzCnJSRA6VnleqQAknE1CrWiYiVZZJo6gSIJK0vMf9s4h/T3bTbjK3LNB+612Cw0S/a6h8821A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR03MB7631
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260703_035136_067650_79C06D9E 
X-CRM114-Status: GOOD (  11.39  )
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

From: Adrian Ng Ho Yin <adrian.ho.yin.ng@altera.com>

Map DesignWare I3C master CCC hardware errors to I3C M0/M2 error codes.
I3C_ERROR_M2 is reported only for broadcast address-header NACK
(RESPONSE_ERROR_IBA_NACK). Target address NACK remains -EIO.

Signed-off-by: Adrian Ng Ho Yin <adrian.ho.yin.ng@altera.com>
Signed-off-by: Tze Yee Ng <tze.yee.ng@altera.com>
Reviewed-by: Alexandre Mergnat <amergnat@baylibre.com>
---
Changes in v5:
- Unchanged from v4 patch 2/3.
- Add Reviewed-by: Alexandre Mergnat <amergnat@baylibre.com>.
---
 drivers/i3c/master/dw-i3c-master.c | 24 +++++++++++++++++++++---
 1 file changed, 21 insertions(+), 3 deletions(-)

diff --git a/drivers/i3c/master/dw-i3c-master.c b/drivers/i3c/master/dw-i3c-master.c
index 6998ffd15f5f..974b9fc79356 100644
--- a/drivers/i3c/master/dw-i3c-master.c
+++ b/drivers/i3c/master/dw-i3c-master.c
@@ -493,6 +493,7 @@ static void dw_i3c_master_end_xfer_locked(struct dw_i3c_master *master, u32 isr)
 			break;
 		case RESPONSE_ERROR_PARITY:
 		case RESPONSE_ERROR_IBA_NACK:
+		case RESPONSE_ERROR_ADDRESS_NACK:
 		case RESPONSE_ERROR_TRANSF_ABORT:
 		case RESPONSE_ERROR_CRC:
 		case RESPONSE_ERROR_FRAME:
@@ -502,7 +503,6 @@ static void dw_i3c_master_end_xfer_locked(struct dw_i3c_master *master, u32 isr)
 			ret = -ENOSPC;
 			break;
 		case RESPONSE_ERROR_I2C_W_NACK_ERR:
-		case RESPONSE_ERROR_ADDRESS_NACK:
 		default:
 			ret = -EINVAL;
 			break;
@@ -708,12 +708,29 @@ static void dw_i3c_master_bus_cleanup(struct i3c_master_controller *m)
 	dw_i3c_master_disable(master);
 }
 
+static enum i3c_error_code dw_i3c_ccc_map_err(u8 dw_err)
+{
+	switch (dw_err) {
+	case RESPONSE_ERROR_IBA_NACK:
+		return I3C_ERROR_M2;
+	case RESPONSE_ERROR_CRC:
+	case RESPONSE_ERROR_PARITY:
+	case RESPONSE_ERROR_FRAME:
+	case RESPONSE_ERROR_TRANSF_ABORT:
+		return I3C_ERROR_M0;
+	default:
+		return I3C_ERROR_UNKNOWN;
+	}
+}
+
 static int dw_i3c_ccc_set(struct dw_i3c_master *master,
 			  struct i3c_ccc_cmd *ccc)
 {
 	struct dw_i3c_cmd *cmd;
 	int ret, pos = 0;
 
+	ccc->err = I3C_ERROR_UNKNOWN;
+
 	if (ccc->id & I3C_CCC_DIRECT) {
 		pos = dw_i3c_master_get_addr_pos(master, ccc->dests[0].addr);
 		if (pos < 0)
@@ -753,6 +770,8 @@ static int dw_i3c_ccc_get(struct dw_i3c_master *master, struct i3c_ccc_cmd *ccc)
 	struct dw_i3c_cmd *cmd;
 	int ret, pos;
 
+	ccc->err = I3C_ERROR_UNKNOWN;
+
 	pos = dw_i3c_master_get_addr_pos(master, ccc->dests[0].addr);
 	if (pos < 0)
 		return pos;
@@ -781,10 +800,9 @@ static int dw_i3c_ccc_get(struct dw_i3c_master *master, struct i3c_ccc_cmd *ccc)
 
 	ret = xfer->ret;
 	cmd = &xfer->cmds[0];
+	ccc->err = dw_i3c_ccc_map_err(cmd->error);
 	if (!ret)
 		ccc->dests[0].payload.actual_len = cmd->rx_len;
-	if (cmd->error == RESPONSE_ERROR_IBA_NACK)
-		ccc->err = I3C_ERROR_M2;
 
 	return ret;
 }
-- 
2.43.7


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
