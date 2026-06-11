Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05894CD98CE
	for <linux-i3c@archiver.kernel.org>; Thu, 11 Jun 2026 01:54:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AuGE8IBeBo27xif2qEqXWi64qtErvRVuR56caljoNGM=; b=kAjV8pDWEAmGzk
	PteDAhGIhjJ3PjafGVZBXQJ0oYrLWOzKL9rXsA6zQEMbnxdEvypECU8px7SeX6k7oILfxZSP5HXDn
	4wzedYhJ77vb6CGoMCsl7ACSAjGtgDTXCutHfoHJ+knsiKSBmQd+MRvf8tmshYoaOO1pwViI5H8Pd
	pCBkojeFqG17YF50Tcek5v947qD47VW0y8ml854cw8LqEVA3MA/rNH0TCt1FWICUVGylJr8mnsaEc
	1mahQQo/HisXaswQnsc1r3GeNmQxclRAU+75SlaqSnM6riz5HB8bspNLuKamF+GhOVnXKp4hZ4TBK
	MogS5scpeF1668vwhIgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXUce-00000008XP2-2VOY;
	Thu, 11 Jun 2026 01:54:20 +0000
Received: from mail-southcentralusazon11013018.outbound.protection.outlook.com ([40.93.196.18] helo=SA9PR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXUcc-00000008XNu-2IE9
	for linux-i3c@lists.infradead.org;
	Thu, 11 Jun 2026 01:54:19 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fsVjp05RQR6dSSieNJuiQSmsWufvhymuV4VaJATCaXeHD0fp+0G7a8y4EZo5syn99L9BidmEhvppVnAnww7dJofyr9kRrPtDR95k00eMitCFNwS3H0gsR+2pub7SIOOieF4iCgP4YyzPkW4EAs72sYVSTAzMvPp8g0fnk+tb5aSNBBNdBzbYAAdRBF01DZlO1sYsBt/cKct5vb0AOJCI/QJCF7mNOsULcXNFK5Qy8GN8GCpJHza81gHBDHDMvb4dHP/iLQLWHwV1C9pJrJDHmaFMS6GSKeGf/lpoiOHTWoIhOTJG2EYET/vZttBSZT0fQG0eu2tCbGld/ti17W2IdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PMyzClFfwSypfrzbuN5t4SH6Wsl0YMrZA2NVqdeLDOE=;
 b=BBN0cbnfFSgagnbMpklrLWkh2ihpg9ni2hUnN/GKnXrEdM95W4TYrwfesGYCTalq+SnAe2BucPSMsnp3eFAVp2iXCBmvt19WmW52WIHATYAwKbX6TsmLzvsRkwzkTzNic1eItP7uImoCDRfhDOG4ST5jVm6BVu189cifnOujTKIXxV0IqwvJL8qcYax9GLcJ54pW1YEyJcOnMFhw1mTPU8KKGnaOJrDwouFwwCw4hZm48qnveqdpUisrA9mWa+wazwEiZniG4tKjSwwYX3B5eobwC9mVMtC4RWpB1XKvtpX9bKIN54Up2jLA0ZrAO+wlrG5KOLpAB0lirnjaKirZiA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=altera.com; dmarc=pass action=none header.from=altera.com;
 dkim=pass header.d=altera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=altera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PMyzClFfwSypfrzbuN5t4SH6Wsl0YMrZA2NVqdeLDOE=;
 b=ObcWF1SKeIF5YTYlWECfQszCz8eO/iU4cH2KgnZjFIt/PgwQrZc4nz3BNeOUDST7Uw4pWva+Ch+ws2vTEYAhaoGzNoB+wwa3k512TTiKUgtJ4PeYc4vSp5SfNxS9xPgGNIgwGmKJq9EK/fXCo2XNLGwLPtcexj1V/QUB+OBEepYP9sXeF48UkGXzpNhDPZeo5padpS/768emNIuVcTqz61CZOtTKzznMCD3yDq7tPRt/XAQCq5Egp57Q4S1u+FfLy62qtZtdeUYXhDM414L7XLhnMETcgl79Gzd/JIYnAa/QjYFxm8TnUtxmbZB0/BEkW+ermt9dyDKdOdya/7Yp/A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=altera.com;
Received: from SJ0PR03MB5951.namprd03.prod.outlook.com (2603:10b6:a03:2de::13)
 by SJ2PR03MB7332.namprd03.prod.outlook.com (2603:10b6:a03:566::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.17; Thu, 11 Jun
 2026 01:54:11 +0000
Received: from SJ0PR03MB5951.namprd03.prod.outlook.com
 ([fe80::f285:8376:68af:6acf]) by SJ0PR03MB5951.namprd03.prod.outlook.com
 ([fe80::f285:8376:68af:6acf%5]) with mapi id 15.21.0092.011; Thu, 11 Jun 2026
 01:54:11 +0000
From: tze.yee.ng@altera.com
To: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Frank Li <Frank.Li@nxp.com>,
	Adrian Ng Ho Yin <adrian.ho.yin.ng@altera.com>,
	Felix Gu <ustc.gu@gmail.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Manikanta Guntupalli <manikanta.guntupalli@amd.com>,
	Jorge Marques <jorge.marques@analog.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 2/3] i3c: master: dw: Map CCC hardware errors to I3C M0/M2
Date: Wed, 10 Jun 2026 18:54:07 -0700
Message-ID: <a4d909479fb8d78e930398fbdc94289d0a173a09.1781142158.git.tze.yee.ng@altera.com>
X-Mailer: git-send-email 2.43.7
In-Reply-To: <cover.1781142158.git.tze.yee.ng@altera.com>
References: <cover.1781142158.git.tze.yee.ng@altera.com>
X-ClientProxiedBy: SJ0PR13CA0161.namprd13.prod.outlook.com
 (2603:10b6:a03:2c7::16) To SJ0PR03MB5951.namprd03.prod.outlook.com
 (2603:10b6:a03:2de::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB5951:EE_|SJ2PR03MB7332:EE_
X-MS-Office365-Filtering-Correlation-Id: 4d69f3dd-5853-4139-7575-08dec75c553a
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|23010399003|376014|366016|921020|22082099003|18002099003|56012099006|11063799006|55112099003;
X-Microsoft-Antispam-Message-Info: 2XlONlxIxOEwXAZCqJigC0hgjDYFtCmu5+Z8fA8ZPmhUOCjOoRaN/YW9tvbHelIVlk03iCxwu+J6E9BcIgTT3jy4h0Jg9m9+4+0N9n95Ri4HK8a9RO5qtqD/F7ozUm1owSggWTvoQL+Wn6i0iiPLh7XeaSfyCcfwQuk8GXaY5gkhku2kxGUK0Jb3HQa41Ze7zd0HgmTKn14hB3UiKBPf/qqfZM4jyO3qRVPjgms0HI2qb2sbJqa4bOv47njBVlmQgRqEsizwQja+xzr2CiQp7a3QzE1HgMeK69VVCNbT4dXGyzw6M6DRqPTHxq2QgVSMXiBQKAzweN+ZeZZqQJ8Y1gZnXmKyZGrhLhnTySu5G9qOjhrrCkaDTPimN5CaTCjC2sHTytYIcDLcvzLq9XIorRMeUu4Ef6xY1lhUpDWi30xcpen9dch8pq+i/dFbLNT80MP0R/18LK7b0DVUngp260uyYgTx3OP9vLSQcCLHV73+9pfpqhb8NSfR/aY4ssOfN2GN7Wb29xnTcuQixvQNgMZwmGUKDMrEqKo7/BZh/Gj7OqLNhgv9zntL6lr/CSofQ4qPUS6IiXWndqtEnI15jgeGaUkRwuzNL2n+CxULsiwIULO225ZjETGME6WNsa0KsPzwDLZ/mkwf3PB/QXsgnpgXiGuo5+Qwyxy2rumX6vsLJpw73m7ktqb6rNNgUmWcFHPS55TqQCnytNJQVEH2rJZ5xRcyj/wmC7u3oSKsaQmC7iglZpMuv2CdEkmsbGqa
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB5951.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(376014)(366016)(921020)(22082099003)(18002099003)(56012099006)(11063799006)(55112099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?QpQKGh/qsDfpWB64JiMJaJVSp1I4iSPA75M1CvvkAxlJdPpTqZDSUI3VUDxK?=
 =?us-ascii?Q?+4maMnNrvUTcGtSTGVFPpzo46rf6lhqzrlki1++23NOq1gCuUT34tNCkeV60?=
 =?us-ascii?Q?f4dMItZc79yQ0cBkO8mxe/oDaSlWykd6RnsHtnzL9EIfQ4USxZpy+r5mAreU?=
 =?us-ascii?Q?6FvKMTQHkiDEMRTYBn/QjS2tB4H9OAIPaFZyHlneI1GISBZx5jsZrKUjAUKU?=
 =?us-ascii?Q?l42to57McyvEq09KFwILTxFJfWJykO99md3/to2npiPf+kHI7JdmhpCdiDBs?=
 =?us-ascii?Q?+H30vSIPAjFfb4mg8JoSI29za6khSQ76k9/fWHbWPFn9ynCaJWIM/4e6+WLt?=
 =?us-ascii?Q?8g9zUqB5I1nkurGIdQbYuB8sgpiSN5GJVJCdyRynHapmX/+Al2w8zn6DTeQg?=
 =?us-ascii?Q?mCgt20Jd4cMsr8Yw709UOvIDpmntREnICqACCFxh/xpytLMj93bwoqzWMfJK?=
 =?us-ascii?Q?QWixQFYhjNQuQOG/6PQAbAb955UO2Fw2UdFR29dBd98/+7Rm9VBP3xlFIc3Q?=
 =?us-ascii?Q?73umc//Vu/ZhMGcMAPFduNHtsBk+KPJRTudSJOZIVQHqskDdYgC67E5n9z07?=
 =?us-ascii?Q?Q01fkgSZLN1XYAxIt2G1paWd3WxZmVlreMKlgxWDXOv8XmOVrgDSzANItmhp?=
 =?us-ascii?Q?BnwiuzahgHUaN7tpXI+dI072xLzqtmqwH8ukJOTddO7M/o87oEhIqt749ETs?=
 =?us-ascii?Q?b3eSbGosG6rgvF+wL4QZQQ1IkRC64i1mgEP1GDD3R21kZzT0ZL97pDAbkZqH?=
 =?us-ascii?Q?IOKlhfafFVa1Us8ry55rgho3ZlAaHB3yNEye+DZ5pQuM+s81DRwLYwORFErh?=
 =?us-ascii?Q?yJUGhLUYjJUMAP5vwwoFLZkh2RrgA26F04hKkXcU6QMBeaapqT3R0nbNi2Sx?=
 =?us-ascii?Q?dOqrKnYrGe+l9O+UjOv9xpIZw8YizNtKLdnGaFTCoOWR9I2Zsqy/Yz1Mx7w3?=
 =?us-ascii?Q?578f7XpCVUJuVLpsn9fNurkXdUzCnnyTHbLIUFG5Lc2Izkfn5qCrM/MFgfQz?=
 =?us-ascii?Q?tK8FW79zq6vSLgMo2x9SpZDv7WSeRkyRRkbPreH8kfFKS9IruhWSOWTLixZc?=
 =?us-ascii?Q?An7oQxTYOaBLA902upzsQHDbvduHpghf4HBvZmVVup8VIJiWb+ER59USYwCl?=
 =?us-ascii?Q?Zi++Q48dHga/mmU+cDl/tMpnb6mK4O3Qjqj2e89xyD2QHc1dpPR/a9vNkJNF?=
 =?us-ascii?Q?85zLEbqynfQbW2+sMfWYEakqoKSkzdr0hSBRvoGSUPS9ThZDyrNhouLACktT?=
 =?us-ascii?Q?ky7ff1y3hJOvtF2ZGsVX8LEv0ATQhFnVRqN3eCtFI+S8+E5fDbxd+ebQ/cgT?=
 =?us-ascii?Q?vzDAySXFKLU8ahOOBb9pc+l4to945wm17pdlpYP/L7R7VBdiaarXDRW8fWLe?=
 =?us-ascii?Q?SlAI6HKnp+yBzXgOMbM4Ld2P1OrBHKzRoc2h+W/Z15J+HoMCyCOehl4CX8p3?=
 =?us-ascii?Q?R2OyZtKWQiv59zTRbckDnjGwL82LTze3B4B8EyBNRmXztzDhtqptc10JiIzt?=
 =?us-ascii?Q?yYYISNcZt6xtkMkFrVh2VBM5ryNsv0ZoXuM7bTDC8nrf6zIHZ8MKR9fWV4dt?=
 =?us-ascii?Q?bUBUBx5KaGhySUy0pZPlSRCHF/WHv5Hz+1fMO1qHZFOCGzJp4+qoEzowkQ3P?=
 =?us-ascii?Q?O1/b4ur2dXcr1anYjks1dGYVjyCg4031EkDKuJ7p3SQl6IqCb9C/qUvKoqSz?=
 =?us-ascii?Q?FTn2p8H+Z8TLgllh9n8ZkthURP34MiV0H2cLoqWnAQaDZyUwK0IRkVryoUae?=
 =?us-ascii?Q?93FWGflO1g=3D=3D?=
X-OriginatorOrg: altera.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4d69f3dd-5853-4139-7575-08dec75c553a
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB5951.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jun 2026 01:54:11.5294
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fbd72e03-d4a5-4110-adce-614d51f2077a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8ZTRmAW9N9NqIVYLkQmc8oRSKIK8A0YwV6oU1+AqH0nNG0V1v3FRoPHAiSkH/srv/Mh0lBrDDmDBLj8iRJBpjQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR03MB7332
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260610_185418_579100_6824CF87 
X-CRM114-Status: GOOD (  12.31  )
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

Map DesignWare response-queue status to standard I3C error codes in
ccc->err:

- RESPONSE_ERROR_IBA_NACK and RESPONSE_ERROR_ADDRESS_NACK -> I3C_ERROR_M2
- RESPONSE_ERROR_CRC, RESPONSE_ERROR_PARITY, RESPONSE_ERROR_FRAME and
  RESPONSE_ERROR_TRANSF_ABORT -> I3C_ERROR_M0

Return -EIO for RESPONSE_ERROR_ADDRESS_NACK so bus NACKs are not reported
as -EINVAL alongside I3C_ERROR_M2, consistent with IBA_NACK handling and
other I3C master drivers.

The M0 mappings match the generic I/O failures already reported by
dw_i3c_master_end_xfer_locked() so the core can retry transient bus
integrity errors on CCC transfers.

Reset ccc->err to I3C_ERROR_UNKNOWN before each transfer.

Signed-off-by: Adrian Ng Ho Yin <adrian.ho.yin.ng@altera.com>
Signed-off-by: Tze Yee Ng <tze.yee.ng@altera.com>
---
 drivers/i3c/master/dw-i3c-master.c | 31 +++++++++++++++++++++++++-----
 1 file changed, 26 insertions(+), 5 deletions(-)

diff --git a/drivers/i3c/master/dw-i3c-master.c b/drivers/i3c/master/dw-i3c-master.c
index 06fdf8857b9c..45bde92d0342 100644
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
@@ -708,12 +708,32 @@ static void dw_i3c_master_bus_cleanup(struct i3c_master_controller *m)
 	dw_i3c_master_disable(master);
 }
 
+static void dw_i3c_ccc_map_err(struct i3c_ccc_cmd *ccc, struct dw_i3c_cmd *cmd)
+{
+	switch (cmd->error) {
+	case RESPONSE_ERROR_IBA_NACK:
+	case RESPONSE_ERROR_ADDRESS_NACK:
+		ccc->err = I3C_ERROR_M2;
+		break;
+	case RESPONSE_ERROR_CRC:
+	case RESPONSE_ERROR_PARITY:
+	case RESPONSE_ERROR_FRAME:
+	case RESPONSE_ERROR_TRANSF_ABORT:
+		ccc->err = I3C_ERROR_M0;
+		break;
+	default:
+		break;
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
@@ -742,8 +762,8 @@ static int dw_i3c_ccc_set(struct dw_i3c_master *master,
 		dw_i3c_master_dequeue_xfer(master, xfer);
 
 	ret = xfer->ret;
-	if (xfer->cmds[0].error == RESPONSE_ERROR_IBA_NACK)
-		ccc->err = I3C_ERROR_M2;
+	cmd = &xfer->cmds[0];
+	dw_i3c_ccc_map_err(ccc, cmd);
 
 	return ret;
 }
@@ -754,6 +774,8 @@ static int dw_i3c_ccc_get(struct dw_i3c_master *master, struct i3c_ccc_cmd *ccc)
 	u16 req_len;
 	int ret, pos;
 
+	ccc->err = I3C_ERROR_UNKNOWN;
+
 	pos = dw_i3c_master_get_addr_pos(master, ccc->dests[0].addr);
 	if (pos < 0)
 		return pos;
@@ -784,10 +806,9 @@ static int dw_i3c_ccc_get(struct dw_i3c_master *master, struct i3c_ccc_cmd *ccc)
 
 	ret = xfer->ret;
 	cmd = &xfer->cmds[0];
+	dw_i3c_ccc_map_err(ccc, cmd);
 	if (!ret)
 		ccc->dests[0].payload.len = cmd->rx_len;
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
