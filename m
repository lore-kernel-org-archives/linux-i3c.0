Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DD8ECCD184
	for <linux-i3c@archiver.kernel.org>; Tue, 14 Oct 2025 16:28:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=9wi69bG9ledlyqhANQAPj6spK8m1frZcyXzUPwmE2j4=; b=2gMxDmgDYfMAuX
	8hIoWb1UQYbd99gGP/rs+Gs0qjpkKQgB4qiRolTclwA3jrZeJBUpv49cQj7Pi5+k3UBJSKez098F7
	uBxizXGJ56y/5YMZmjt/40j250woDfY670DyCSfu8cg6Xa+DVE1i1cQ4TVy3pz5Y6rz0DdvMCrSRc
	yOeC3UNPzSF4bMXF5MD/HEK2mRpgkGjl8nS+29LmZbDvkyU4vAGvBDoM7VZzxJD+MOGsn4PuX+eZL
	2XcLbHy4F/gZX6hNINne4aqLy5lC15mhrzd2UnDEUbTQdxtrvdyFkfJq8Lv9WO2aYCnNUmZJanaMN
	sMIBGmftubDfNalNlXFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8htG-0000000GzGH-0DZq;
	Tue, 14 Oct 2025 16:28:46 +0000
Received: from mail-northeuropeazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c200::3] helo=DU2PR03CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8htD-0000000GzFu-1JdC
	for linux-i3c@lists.infradead.org;
	Tue, 14 Oct 2025 16:28:44 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hTXzXshjLTTj+A+uvoZvLKttIGXphEsmlQfKeZHc/mE0vRtzWtpaakNT2KRZUGUR0ANN7nR8DO0Ukgda9pf6MeSnzyp+KF6RY3LYFssk+rbjUciGeFzBLfNZV3NaIegOb+Z9VlLpTqRiUYVLda2d4mK6o8NFrUmeuHzdXGeE0jXOc9W5yyRNGT5Z6E4DC3tlM1VwQFmBDpDxFjZRX0HyIYqXYpnBYFNxXLFKdHG+OompxNebOmgGTyYt9M9LDmTErdYwFgNWAJksaDc9AI1vM0R8LcgsE6aC5zXCTDZQzwzvDorcdqt1FedAIXFnv7dkYfrBGKiR1Qn6j0IPeN9Crw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=blVAp5RKUtNA0jab27czo5gHDZ9I4YGZe3IAnxUpfjw=;
 b=Sky5cB1ipx71fBrnOR6zEfQInTTcHWTPY02VAzvI91+ew9kN0dv8cNgGJmrJTZRPWnOubAgo3tnJ6jSYUWqms9arOLSA4BPLFqFantMTuZEelI1C7TxhJAQ+DLh8u4l3RC8MiIMefDi7mEhQbcIdzNqP97qiSaoWgiCG7+MvojRDkhiGdtiHttLuudCtW0HR9GCR/UC8IBYmylQW8VCF8RVR8R84V7kovMmWOFziagbG/qrfcL0BSuzBS5D6H9WB04SA0pcez3a5V0RK19jySds2RQT1vdKNCKzMrL4nIYUKeuvK2D41A2UpSUCw4BDKckrbihg8aRH8W2LnArFBPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=blVAp5RKUtNA0jab27czo5gHDZ9I4YGZe3IAnxUpfjw=;
 b=iAaFp6rIXy5x7zR5q+olsTy3/8/RvEYOjAmdI73mC91QSPfgwjAQRUZfWMUaDcSQBA0tNqQHAGeQMKgYtApIdZoGUCX4V710Vxxy8yh1aUeo8Qv0pLdoVqW4M8UrPDlXHiPmHGb5N2Jtyj9CRL0JO/GvPes1lv/Q71jZLylbJm3qSBwHWHimK3EiQtS8VCUV/OKAuR7hSWcUme4k31BdVhLdtQ8gMPtwZ959MSEcajyWXvQ0okwTNfd+ZI0Y9Nk3I82mpB4UQJMUi3XeM97cd25LOU6yosLtrq32KbTo/Tz6od5tXOKEk3I5yR+JfufwIQCnZOy/JPt9gjuCZamHEQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXSPRMB0053.eurprd04.prod.outlook.com (2603:10a6:102:23f::21)
 by VI2PR04MB10906.eurprd04.prod.outlook.com (2603:10a6:800:277::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.10; Tue, 14 Oct
 2025 16:28:37 +0000
Received: from PAXSPRMB0053.eurprd04.prod.outlook.com
 ([fe80::504f:2a06:4579:5f15]) by PAXSPRMB0053.eurprd04.prod.outlook.com
 ([fe80::504f:2a06:4579:5f15%6]) with mapi id 15.20.9203.009; Tue, 14 Oct 2025
 16:28:37 +0000
From: Frank Li <Frank.Li@nxp.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	linux-i3c@lists.infradead.org (moderated list:I3C SUBSYSTEM),
	linux-kernel@vger.kernel.org (open list)
Cc: imx@lists.linux.dev
Subject: [PATCH v2 1/1] i3c: fix refcount inconsistency in i3c_master_register
Date: Tue, 14 Oct 2025 12:28:23 -0400
Message-Id: <20251014162824.2324333-1-Frank.Li@nxp.com>
X-Mailer: git-send-email 2.34.1
X-ClientProxiedBy: CH0PR03CA0046.namprd03.prod.outlook.com
 (2603:10b6:610:b3::21) To PAXSPRMB0053.eurprd04.prod.outlook.com
 (2603:10a6:102:23f::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXSPRMB0053:EE_|VI2PR04MB10906:EE_
X-MS-Office365-Filtering-Correlation-Id: a8a9a370-87d6-4099-f06e-08de0b3eb9f9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|52116014|1800799024|19092799006|38350700014|13003099007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Bo4z1Dtq6yL5Qvy30gVau7d4uFT9TSEG3b8c9fqHg7szIw/awzn5SGRPqje/?=
 =?us-ascii?Q?3bAcYryiZp6XFHnShxfKlBPNrb7qpXbm4jYmwuTscUT0cL00lq5zDisUD7n0?=
 =?us-ascii?Q?LFVAngHiGtqAH9trqmHmvRk5V/Pl8FFORsjUrqcOG5j370PIiLmPvJ5TsoQj?=
 =?us-ascii?Q?znFJs0Bc7gIBmAuPZCPGYVwMAGLXj8CSGHFJ8vpkDqrR/psqINm5il65Sfzu?=
 =?us-ascii?Q?/7WILXLhdL2grkpsaOl6QlqU4Ds/YzN8PTjmUzonYSiO2oSdrUkrFxCNzMC7?=
 =?us-ascii?Q?QAUjrR3tjicpEMmyiwjlc31S22U6gjYyYXYkp6oShffHoZhszXAMkSpD4dLd?=
 =?us-ascii?Q?CUOjTliyYwUY/CEimEyqbgqOm90bdiSCD3fe84gixXfydt42FjuADMzM+AMG?=
 =?us-ascii?Q?GzdliOzjBfSNOyVzCYpgAYCtZFoSog1U0xClaw8aqQcVO+n87HJd2Fb5PAbC?=
 =?us-ascii?Q?IQbKq1FRD03POatyBGFbjT5QdmLxg8SCxLcXKbxegsrs4qSSf+Q+5PO5k/j/?=
 =?us-ascii?Q?hgP+Pah7ZUsXIn0Td5nkdArUAYjJio09ZVQz7n4JAILO9bgahrK5fSdtPIsQ?=
 =?us-ascii?Q?nlS/3f2J3h/7DwdYxCzI9x8APQUbluinPJkJd9ClrikozKRHzAjKx19zgpdm?=
 =?us-ascii?Q?sAjB3gRn3E6FT4IjIA7ZjXY7nc2d00YAfrY+QR2D/9CXhViM/WZKdwDfFofu?=
 =?us-ascii?Q?FMNoDyJLTL/nKdLlb1XPxM0D3NUdc8FfEOvYyReWjOONplKHePp1ATNHOLbX?=
 =?us-ascii?Q?vaTPKw+umUfWbZe0WkZPvCTgXgnJzX0wGcZIz/wDd3T/b6vTdk70nEZXgjbd?=
 =?us-ascii?Q?MyU/YzhU2WwmsEf06JGz+/wayYLwcvyOff4pj0vdMpHQ2+b/i1ee0vzpcAXR?=
 =?us-ascii?Q?UkdMaWzs4cVv/MCVT3xgDGEpSpesNku1otOOlAQUckmunGDZXrFz6c5MrHfd?=
 =?us-ascii?Q?KVGlMtzeRmoR+Vm+DKztcupSz0xBJbEEMGKXXDdTd1r8MYKwDaR/DN6n4weW?=
 =?us-ascii?Q?ygSkVdkLDRIOzu0DdvjRobggH3VBmmpnrM5GBa+53w/9fh0H63c20eQn0tWH?=
 =?us-ascii?Q?+2dJQBygSGs2kBi18mgNtERMez7FnOhZ0Ptx28XHuVSUHY/W9sd2rJPkGL9c?=
 =?us-ascii?Q?tlsRvMLmPWxcn3mOHXLumgS7gY1rryCTOd/fAmF/Rn8zT4VMJ4zDU7wOZgkF?=
 =?us-ascii?Q?+xbISatuzrxsSLqHDFmtZ0RDL1AeAV7z30VeQAsH8bJg57r1kXByQbB71bUU?=
 =?us-ascii?Q?vp2HG/ZacyAX7a0WmVRekv2bJa+H7EALdJgYIhjYyUnhH+9f/UkNvymMZI8Z?=
 =?us-ascii?Q?x2rHhIrk6PwyCLsdS32NAmfQz+o3IfODMQIDQGi/qaHHHk7xuN5x5+fZ3h8i?=
 =?us-ascii?Q?9iitsEnGhHisX9LdbzSqHgJ1+XUSqAhi/6rkM3iCCfp6OSDaYeCkcwa0mJz4?=
 =?us-ascii?Q?n/rzkqJnlcKxDua92hSxsEq7IuJZH5wjc2nNt1SDVEAlVKtmUeNmuQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXSPRMB0053.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(52116014)(1800799024)(19092799006)(38350700014)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?UNMBSbxvqS/3k4BjaX1cFDWsX+S5X02HiIyFx5ZH7MlCdEFj0OjkE58tDtJN?=
 =?us-ascii?Q?nxjb5Q3WdwD8UU+pnlf6M+xW+v2J6VwuUT5UP3cFq+zURnwigPpevOqLJ5L/?=
 =?us-ascii?Q?mJZr59DiPCUtnqX9Tl1NyVjmPhVBdR/xXslUK6V4O8cSqTXX4mhTZMTZa0qc?=
 =?us-ascii?Q?J+uEZGhBTxVD2Kx9Fip1dyGxfF2XyoBpApuKMs32uwYFk4zTOxN52PjOApJk?=
 =?us-ascii?Q?8kAxCbVWDj+gNXaNkPgRSjX5i68GKaVzqGzoN9p3gfs+N1MyTjy0IPDTvQzQ?=
 =?us-ascii?Q?7ScaZvBNgtnju8uzgvcsgQB/T7xa7P3ozG2jhyux+jDuj8Mb0NQgLGR6sp4j?=
 =?us-ascii?Q?uwynXb//UkuW5ml0tqV0NLRvpOs8MFhNRVW4SLdSN1ElGBdmI1w29zsbvaLY?=
 =?us-ascii?Q?dVAqlP1/ZIzqpOjYbmIPxV/FeZ6meL35C2CUjJU7oek+oeqrmFkdCov5HfWh?=
 =?us-ascii?Q?zfFR0jnbN2U9LWNS3r5BmdhjYfHY1jycR3MrKBwbMzXXLdh3EKfPIdrBjq9B?=
 =?us-ascii?Q?81yP4b0kne8oJJHLAB8zBgeyP7eCqqN5m39AVMJp2XwqCpUruH4foIk9+AbT?=
 =?us-ascii?Q?qGUhVmeK817Db0MdiNuE3WKaFIzhi29dIkP8M5jDh+az0c+Oz/CO8ooqNRfw?=
 =?us-ascii?Q?3rLG/eDIl1/Dd20y9IWiG36z9jlQyaDcl907pn4CUdD3jK6ZVqc0C1MFBh5e?=
 =?us-ascii?Q?R47298l/OtNjwpgRLPAhZzDNb9w43Kjdt+0yLDRLzHjTruLLi0Ov1+pscxfg?=
 =?us-ascii?Q?oH9MufSeECvT9KnS1yWVEtgi0bdn3qCk8M883bGKoKh71ZVtMv5DQrJ9jZzW?=
 =?us-ascii?Q?Fza0ee6d0mY6me82Dwijd3h2xRw9SKkHgzS5zkuZdtlTvlaOmqYGd6cUbRty?=
 =?us-ascii?Q?qh2M1OAIWAkqRnC7eIBXfhvDi9vOLqLCv2uqyN/w4/lsGQEgdWQf+6p4/QHE?=
 =?us-ascii?Q?TCLAp1U0ALb+UnkEK/lTyrbGoWxPAPWXrSpoxTfbVhpdFfRz1XfmOuDi5JU1?=
 =?us-ascii?Q?YXtL4VhkGDW3ES/6RKW4kydrbeFFcgvPgCJjeFcNgQafxI0w94P1JUBSRPZb?=
 =?us-ascii?Q?T/+ke5V7b4oGPUu5XYfckRy8EELYp1Bul8+iFSuqsN9TD+oktEdCPThiR/+6?=
 =?us-ascii?Q?ABt1BwUnCqe7VRnMKJVSVY44fWeqoXv1YzOBpuqbBRZvpZxMmG9xhp2LFLoF?=
 =?us-ascii?Q?RUONyk0hxnRCls6AM5q5RARC9SvbBDJdxnhZ1kK79XRBYtkXfqMsDpL/su8K?=
 =?us-ascii?Q?BrfB2k3JclRvQ8CKbzHNxB/98o0AGknws5cNk8AODdLPc06ly1g00HtQ63Gl?=
 =?us-ascii?Q?JklmjATN8pfGfk7SyxwgeXgJYhax2+O3laW6SUPJT3Y2Rr33haVvf+WSHo1a?=
 =?us-ascii?Q?ieACxDqSXDFKB/cVWiTYZL4V/0nk0IUMkB6E60jMSpkuPzDav+ULSa9q83kd?=
 =?us-ascii?Q?deZDReVxyJyAbbUtjYepQBLl0mqhSoPjRMdmcFZ0Y+22XA6VxymcOEZNhI5V?=
 =?us-ascii?Q?ZqwTAUOKUTAtEOZQuE4p7OzOoer7bgW/c93ts7tLFlqNHVP9fKIkJ5riiCFs?=
 =?us-ascii?Q?kDXZzanqtnKt9xixetw=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a8a9a370-87d6-4099-f06e-08de0b3eb9f9
X-MS-Exchange-CrossTenant-AuthSource: PAXSPRMB0053.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2025 16:28:37.3069
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uwvse64MjXYwUrX/PsUXWWUkaTqEPOP937LmQ2DsagiejIBm2jXHZw9v4FCE/ew2zufCa7GvruBXWQJt2v7N3g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI2PR04MB10906
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251014_092843_359225_0D8E51DB 
X-CRM114-Status: UNSURE (   9.81  )
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

In `i3c_master_register`, a possible refcount inconsistency has been
identified, causing possible resource leak.

Function `of_node_get` increases the refcount of `parent->of_node`. If
function `i3c_bus_init` fails, the function returns immediately without
a corresponding decrease, resulting in an inconsistent refcounter.

Move call i3c_bus_init() after device_initialize() to let callback
i3c_masterdev_release() release of_node.

Reported-by: Shuhao Fu <sfual@cse.ust.hk>
Closes: https://lore.kernel.org/linux-i3c/aO2tjp_FsV_WohPG@osx.local/T/#m2c05a982beeb14e7bf039c1d8db856734bf234c7
Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
Change in v2:
use i3c_masterdev_release() to put of_node to align other error path

v1 by Shuhao Fu <sfual@cse.ust.hk>

https://lore.kernel.org/linux-i3c/aO2tjp_FsV_WohPG@osx.local/T/#m2c05a982beeb14e7bf039c1d8db856734bf234c7
---
 drivers/i3c/master.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/i3c/master.c b/drivers/i3c/master.c
index f5f44bd4f4839..b36d4ffadeff2 100644
--- a/drivers/i3c/master.c
+++ b/drivers/i3c/master.c
@@ -2814,10 +2814,6 @@ int i3c_master_register(struct i3c_master_controller *master,
 	INIT_LIST_HEAD(&master->boardinfo.i2c);
 	INIT_LIST_HEAD(&master->boardinfo.i3c);
 
-	ret = i3c_bus_init(i3cbus, master->dev.of_node);
-	if (ret)
-		return ret;
-
 	device_initialize(&master->dev);
 	dev_set_name(&master->dev, "i3c-%d", i3cbus->id);
 
@@ -2825,6 +2821,10 @@ int i3c_master_register(struct i3c_master_controller *master,
 	master->dev.coherent_dma_mask = parent->coherent_dma_mask;
 	master->dev.dma_parms = parent->dma_parms;
 
+	ret = i3c_bus_init(i3cbus, master->dev.of_node);
+	if (ret)
+		goto err_put_dev;
+
 	ret = of_populate_i3c_bus(master);
 	if (ret)
 		goto err_put_dev;
-- 
2.34.1


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
