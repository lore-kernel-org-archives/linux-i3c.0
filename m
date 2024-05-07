Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 730CCC10F1A
	for <linux-i3c@archiver.kernel.org>; Tue,  7 May 2024 20:43:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PC/8YPjykLoRakIwTDi07qS4r+k9JThcqm0CmQGZEyc=; b=0WVF9FtKT5KSth
	9pTr6Dk6876qFCVOg/aGF1yBBCzSIw9Hdj5Cf49R6NqcRE3vLvtQy2WdfmRngovl+MRQmpNuxkNCD
	SdKBO06oxJwvGv4Jh6bbepf2gasG/f8YB/PM5NmrxTLidY+VRt+QNYep6cqldQ49ivMrk7wz/zwcK
	SVeYzgmI+d/v/EU6MHP9pCGI/3h00244Mh+ieF5tMRZ3+9Z623sAxH/sr5lGCH7j+4HuKSRR5v1Ku
	OyDt/Kn+ku3AB2yctPbd86i+zWE6GBeWL+iLcHsPDwE31NbU4oLRALFnf/xwxEuVUAitd2oq0LvyX
	VBGQTTTFQth2iiKCbvRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s4RfJ-0000000Cmth-2blA;
	Tue, 07 May 2024 20:43:57 +0000
Received: from mail-am0eur02on20600.outbound.protection.outlook.com ([2a01:111:f403:2606::600] helo=EUR02-AM0-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s4RfG-0000000CmlW-2HkS
	for linux-i3c@lists.infradead.org;
	Tue, 07 May 2024 20:43:56 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MooQaQM1MUsC01R5qKgkAFvfKNJrocbvWXyxz0BTfPdx3aBgkC4eg3edrISgoS5Eg6Ox51XAf1n4tZHo2EkpJRNoWhfs3j9YYI2LjcVZ9N0hYkGrfT+ZZAiIdtD23wtc78PtubpiGCtGgyX8yqgAi813IMC1OQ7sIBFZ/kKNNTY4e/3lP+9iqvx5kB330PHSM5BL6oiOUK1UA+Qx2ycl3iINcodbyOw7ruNGfdfxkjZC6s/5/XISq/H5T9/b5I5KgdE+Zx1+Taw8PV0IkgKwnqzN2wS14zw0UDztFImOWoStE6pAkoqSFGfL8wms42QUz3HMfSfHCJ5nJaywzDMslQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7elnKms9bN2UvdqPduv8ieP3RqEecL0JMfDSwMzlNWE=;
 b=QdDX32gDpNI3O1BoSJbKleTONb/MVUKGhDvWyfRAqPu738UDixsTpLfO5OxaTocqVv/eerJ2By06gnQz0VOzScOE/YfnDopexR6LL+wiY/5KuOX9PjrGUOB4LdIKo4oplHHbawbngDNJeRoXS4808KQF5p/vL0aUyZqoyJ3uuWEN48Kb7kaYCW3dGv+MUTVRm6ka0GHyDGrOcmPQ0h8oJyweJfEfGzZr/FxDVUrAHy0r2svseTYQAG019Snb8DmhQWwv/UrE1woKHpLeDYivcfkCtqqNr58uGukh31iMTc7kbK81YiD6hGvuV/lczStemVz7ZZu/yp84QrlOYe4ozg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7elnKms9bN2UvdqPduv8ieP3RqEecL0JMfDSwMzlNWE=;
 b=cRVK+3rtHR60I0pwoM1JonJcOy/h9dN7ax2yU1EbJ5ZKPNqxUejWadPPh08GtRGAQhBt0NDb1quq32fq0fOgokGUebaYaRtEs63Qkk8qJ4kL3ah7wxusWBzRym59mQUn/In09g3mmJYRmtSG2nyCDmqfagJ4jf3C5K6u2q7eWSY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by PAXPR04MB8576.eurprd04.prod.outlook.com (2603:10a6:102:217::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7519.34; Tue, 7 May
 2024 20:43:45 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::1e67:dfc9:d0c1:fe58]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::1e67:dfc9:d0c1:fe58%7]) with mapi id 15.20.7544.041; Tue, 7 May 2024
 20:43:45 +0000
From: Frank Li <Frank.Li@nxp.com>
To: alexandre.belloni@bootlin.com
Cc: conor.culhane@silvaco.com,
	devicetree@vger.kernel.org,
	gregkh@linuxfoundation.org,
	ilpo.jarvinen@linux.intel.com,
	imx@lists.linux.dev,
	jirislaby@kernel.org,
	joe@perches.com,
	krzysztof.kozlowski+dt@linaro.org,
	krzysztof.kozlowski@linaro.org,
	linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-serial@vger.kernel.org,
	miquel.raynal@bootlin.com,
	robh@kernel.org,
	zbigniew.lukwinski@linux.intel.com
Subject: [PATCH resend v9 4/8] i3c: svc: Add svc-i3c-main.c and svc-i3c.h
Date: Tue,  7 May 2024 16:43:07 -0400
Message-Id: <20240507204311.2898714-5-Frank.Li@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240507204311.2898714-1-Frank.Li@nxp.com>
References: <20240507204311.2898714-1-Frank.Li@nxp.com>
X-ClientProxiedBy: SA1PR02CA0018.namprd02.prod.outlook.com
 (2603:10b6:806:2cf::26) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|PAXPR04MB8576:EE_
X-MS-Office365-Filtering-Correlation-Id: 0433acde-fc1b-48c7-fc6f-08dc6ed663e5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|7416005|1800799015|376005|52116005|366007|38350700005;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?PTDpCTIFsHvbu322Ct06l5epx4pTAv93Q5F/l2CnvJO00FtW7mMd2j5xLlI1?=
 =?us-ascii?Q?vRvBmrzwACNhiKrUQigfdfXq4a2k6e53Qqu8gxTmAYpRKkkqk1ExGpSQrhzv?=
 =?us-ascii?Q?DX17L55Izwc8cq8S1Ze65E/h20SlK844DNRxTpFCrBPxFQp6lRp47pFcdKqK?=
 =?us-ascii?Q?msTJmj0yjK8Twb2iHFOI3RWOkFyVxoEOc3lQDntWRplYi1PSGlZCmIONTzmI?=
 =?us-ascii?Q?YhsRDZI+x9pL63lFj1De6xYkdmC+O3MGr+iR/YzdLb7KUtlvJtdWDxJlaQ5/?=
 =?us-ascii?Q?ZHO2yUXU7k/NW2XJcPktDYCBqPrTy/cRbxK17dg8KEoPBGdsBq0uCrJpZ7wC?=
 =?us-ascii?Q?Kkm4OpY2uWahZTRAXp6MLYWy7mep4us58bMvBOMJUUWSirXKn/2iMYtPwRyU?=
 =?us-ascii?Q?iwLfiIGXqyYDl3FWefXW5Fpb9Lx1g0WB43XoIXx+5xnUV6/1ABULYRyMdvoX?=
 =?us-ascii?Q?BbmIgHTGDGOdKqIpzYdTmXOjKTbYI5k1PzwO0HxEVBlWYOugoR3rBMB09fOv?=
 =?us-ascii?Q?DSUJawgypT5ZfiO0I9cqdpBjW02vorXHa5N7lum+t+4F1oJncLUHg2oM8T51?=
 =?us-ascii?Q?IdYey7hwKMw4+D1HIX5LQXIanOXxb1ADS6XbVPFedICU7rV+MVmwYUYhty5P?=
 =?us-ascii?Q?54nQlIqlgou2dEoAKl8QxZ4EN5RTH1dfZ88BOdtnT29bf+IKL0yV1T8yRMyq?=
 =?us-ascii?Q?fCTez5ehtDQXiDA9bhvtUerJO7OVMLAoWVErUn3sK0hxTA/BvbfaB978kKuS?=
 =?us-ascii?Q?8dHnT2brnllDV37rdpJuQYC2x1z46JCpyioDwCl1WCJUTE9LGBfjp2ZYj3sB?=
 =?us-ascii?Q?fjjhwvjkOchmyGpYrP7O4m8QnxpDP83x+pt0hCGVAam7iYf9Cv/52PDtK/Rw?=
 =?us-ascii?Q?A8optbEKmEWW094mZFzntmhsKvzRC0lcyFuEA6cYlY3ZKQxs6ZwVzkPVZAzF?=
 =?us-ascii?Q?vKzLPnMxq+bRHC3jixrwRAy+1vIbfVga9xetmlsld6/S3aMaa4A66cW+696y?=
 =?us-ascii?Q?jChXxRWd8h4OdBTrAncMEXVT7DQ4s6y02xyv+RlgKX8tPob8mUjTxfeu/kw7?=
 =?us-ascii?Q?B5AmJGhea7LF284tS53AAmkthOwVF8diaQWqtZ8YQFnHUPYB9stfL7fHLyG5?=
 =?us-ascii?Q?RMCU0AIkdOJAaYMKapIXiaAkiq298H9U9aY3ZnAc3eXHKWVgm3dGpEyX7ODV?=
 =?us-ascii?Q?BKc3TfMAdorj3jYkLqOe/orodE3HmfcWzxZ8hsuKysM+6UbtjSo9wA9JQ49u?=
 =?us-ascii?Q?XB3TNgQWxPEWgQY0HSSkbOpF51HDNhED2wrX0R70TJa95mZFKBF1lGcUFw5R?=
 =?us-ascii?Q?kwTxb5PvinCtPi6FnLHqzvot?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(7416005)(1800799015)(376005)(52116005)(366007)(38350700005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?JoKM/Fq8N9+AWEVKmvfmFfCdAz3d0shYreN461iV5wlS3vaA+tv4fWusCHCx?=
 =?us-ascii?Q?fnN8V7Bxn14QM+7mGZGJeKXTxVgNNX4eAncBNWu2o0gsl+hOBK6bX/Q4H+0e?=
 =?us-ascii?Q?IelIyWJ+nUMUla44KKi3vvCnou/5WwQCjXzyD9J4URm54h8fu6PTeHAthdWx?=
 =?us-ascii?Q?kyZxpOKNEUQnq5z5NI1gmPu0Oap57YAkdgoML09dihMafV3Pws5Cplbh7YHT?=
 =?us-ascii?Q?cUNDDRtVIFJd2EbK1YMJGhcoCAdcYoQDpgqE8xjZ35PNTJiv/eipPzZjKv7c?=
 =?us-ascii?Q?fO0ceg8GXloyRG4QN3S1Gj948CR4S4ioeR0PB2BsrcoD/t9nmUomZsphp6Xe?=
 =?us-ascii?Q?wdnLWEq5ELR4hhwlx6MePZkCGMm5lGKl4P7SNaU7Gw3WyHvkkFwk5BkF2arW?=
 =?us-ascii?Q?fMLl5KR88oqmP6NzUHAtKFwYrMxcdatmHwJkmYsi69Qk/IBB62gHcqeJjZ4S?=
 =?us-ascii?Q?8gojLt1ffmso26McRQS91SUVZhieSJ/HCCvvdLunsFIs3qbiIMLkaCfyxg1D?=
 =?us-ascii?Q?SRwpQL5Ixa30r3ui7PbP9Ek2JG16IoU4/72Oh9y8DBRanL54K9oaNzipVzHe?=
 =?us-ascii?Q?Do902IVa/2Bdh92GQ1vQeaV3N/saa3087ekLEyJSJEEmKp7H7ZUkNtmT+RBc?=
 =?us-ascii?Q?WkXwuVImkExpBI1c0vBWyMQJKlpUOoQFcjm8WjuzTx2bsq2lHZY2i/2kj5ZS?=
 =?us-ascii?Q?MJgmA+xZV8lHRTHBxd6IeQXmXONYJu0nO3NY8PfEN4u1zPkRMbIApy5LpGW0?=
 =?us-ascii?Q?ndID5jhIxdHwqjWJ63BBN8n7t2nXXUk0kr/hJrNP8nE/XkqzKxcF+cTPGGZf?=
 =?us-ascii?Q?tTtb2zbnUlNydybuop9Mo1GSRbKTz4WV+/P+n6eS8hS0CR0FNkv3jI88xFlw?=
 =?us-ascii?Q?dz2yA7MYPXufOj4XBAHbHBm1Y0D82R6RhvK7G0etiNBN1PksQQseyTJEj0dT?=
 =?us-ascii?Q?uw2oUnWw9I29/B/jJJcOSE4pGJn2e/jS0wDPHpTDwDRuGu/+PyK607NeGJdR?=
 =?us-ascii?Q?Th33Yr4Z/Pguu7IVDu56QNpPr/v0ZmtWVLgMn+rehUGZJeo0gJCd1vokA6DN?=
 =?us-ascii?Q?fJ0ly3FgmFnBoo59ggQQ9opp8pkxKmkseetNVxQAzv3jiu6GSARuXg+zjxaN?=
 =?us-ascii?Q?45tKpZLQ61LhI4yLXMYol/TszXUPCqDumB/CnoMezm1IciZ7TIDhEkWpXIes?=
 =?us-ascii?Q?3qTDDRMsN6nQtkLiAxPmpSfL/cDC38EXapb3gFPolZiA3QoLwHcS2lsS6jMq?=
 =?us-ascii?Q?5/8EoBaad4AwCLsTaKvh9SVk9QT+beZs18GId3ASjroucGo/MnjhTJx/TJ5N?=
 =?us-ascii?Q?y1tvcFkH8jgozIg42Oi7VJBLNWI5RYCkQkjXrJeCrD5Mp6v7fzDxmsVcJzXn?=
 =?us-ascii?Q?lZPLEi5SBHKPXVpiiuW/R3dPrRxFq7WZXphD9t/JetlQDABIyf9xciNc50MX?=
 =?us-ascii?Q?YAQs0ThAaF/jGCwXAdrqYw1r5c7E5Zpsy7ahcDymp4ICxncx+xPOY0YMeOF9?=
 =?us-ascii?Q?51Odvy9O7gGO7kjoo8PH+FA8TPFQCKvKgLoN9WNmtnJzrssW611oUdkeMOwi?=
 =?us-ascii?Q?wGYAAc8qtdtpN+I9nYMIG8BPj4ZV+ocf9iv9NhLO?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0433acde-fc1b-48c7-fc6f-08dc6ed663e5
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 May 2024 20:43:45.8932
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pQZQTngWetB3z2cWXJAwk+QOVJvUAaLtpTteHV7Jte3nsp/4PTYURdsIwyUK82RZrNium7AYb+k8/UlovNKIvQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8576
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240507_134354_721664_83370489 
X-CRM114-Status: GOOD (  19.01  )
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

SVC i3c is a dual role controller. Move probe() into svc-i3c-main.c. This
prepares to support target probe depending on dts "mode" settings.

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---

Notes:
    Change from v7 to v9
    -none
    Change from v6 to v7
    - using /* SPDX-License-Identifier */ for svc-i3c.h
    Change from v5 to v6
    - none
    Change from v4 to v5
    - add new line at end of file
    
    New file from v4

 drivers/i3c/master/Makefile         |  3 +-
 drivers/i3c/master/svc-i3c-main.c   | 53 +++++++++++++++++++++++++++++
 drivers/i3c/master/svc-i3c-master.c | 34 ++++--------------
 drivers/i3c/master/svc-i3c.h        | 12 +++++++
 4 files changed, 73 insertions(+), 29 deletions(-)
 create mode 100644 drivers/i3c/master/svc-i3c-main.c
 create mode 100644 drivers/i3c/master/svc-i3c.h

diff --git a/drivers/i3c/master/Makefile b/drivers/i3c/master/Makefile
index 3e97960160bc8..484cb81f45821 100644
--- a/drivers/i3c/master/Makefile
+++ b/drivers/i3c/master/Makefile
@@ -2,5 +2,6 @@
 obj-$(CONFIG_CDNS_I3C_MASTER)		+= i3c-master-cdns.o
 obj-$(CONFIG_DW_I3C_MASTER)		+= dw-i3c-master.o
 obj-$(CONFIG_AST2600_I3C_MASTER)	+= ast2600-i3c-master.o
-obj-$(CONFIG_SVC_I3C_MASTER)		+= svc-i3c-master.o
+svc-i3c-objs				+= svc-i3c-main.o svc-i3c-master.o
+obj-$(CONFIG_SVC_I3C_MASTER)		+= svc-i3c.o
 obj-$(CONFIG_MIPI_I3C_HCI)		+= mipi-i3c-hci/
diff --git a/drivers/i3c/master/svc-i3c-main.c b/drivers/i3c/master/svc-i3c-main.c
new file mode 100644
index 0000000000000..6be6a576cdf7a
--- /dev/null
+++ b/drivers/i3c/master/svc-i3c-main.c
@@ -0,0 +1,53 @@
+// SPDX-License-Identifier: GPL-2.0
+
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
+#include <linux/pm_runtime.h>
+
+#include "svc-i3c.h"
+
+static int svc_i3c_probe(struct platform_device *pdev)
+{
+	return svc_i3c_master_probe(pdev);
+}
+
+static void svc_i3c_remove(struct platform_device *pdev)
+{
+	svc_i3c_master_remove(pdev);
+}
+
+static int __maybe_unused svc_i3c_runtime_suspend(struct device *dev)
+{
+	return svc_i3c_master_runtime_suspend(dev);
+}
+
+static int __maybe_unused svc_i3c_runtime_resume(struct device *dev)
+{
+	return svc_i3c_master_runtime_resume(dev);
+}
+
+static const struct dev_pm_ops svc_i3c_pm_ops = {
+	SET_NOIRQ_SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend,
+				      pm_runtime_force_resume)
+	SET_RUNTIME_PM_OPS(svc_i3c_runtime_suspend,
+			   svc_i3c_runtime_resume, NULL)
+};
+
+static const struct of_device_id svc_i3c_master_of_match_tbl[] = {
+	{ .compatible = "silvaco,i3c-master-v1"},
+	{ /* sentinel */ },
+};
+MODULE_DEVICE_TABLE(of, svc_i3c_master_of_match_tbl);
+
+static struct platform_driver svc_i3c_master = {
+	.probe = svc_i3c_probe,
+	.remove_new = svc_i3c_remove,
+	.driver = {
+		.name = "silvaco-i3c-master",
+		.of_match_table = svc_i3c_master_of_match_tbl,
+		.pm = &svc_i3c_pm_ops,
+	},
+};
+module_platform_driver(svc_i3c_master);
+
diff --git a/drivers/i3c/master/svc-i3c-master.c b/drivers/i3c/master/svc-i3c-master.c
index 5ee4db68988e2..4dfe85ab17fd2 100644
--- a/drivers/i3c/master/svc-i3c-master.c
+++ b/drivers/i3c/master/svc-i3c-master.c
@@ -21,6 +21,8 @@
 #include <linux/platform_device.h>
 #include <linux/pm_runtime.h>
 
+#include "svc-i3c.h"
+
 /* Master Mode Registers */
 #define SVC_I3C_MCONFIG      0x000
 #define   SVC_I3C_MCONFIG_MASTER_EN BIT(0)
@@ -1613,7 +1615,7 @@ static void svc_i3c_master_unprepare_clks(struct svc_i3c_master *master)
 	clk_disable_unprepare(master->sclk);
 }
 
-static int svc_i3c_master_probe(struct platform_device *pdev)
+int svc_i3c_master_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
 	struct svc_i3c_master *master;
@@ -1706,7 +1708,7 @@ static int svc_i3c_master_probe(struct platform_device *pdev)
 	return ret;
 }
 
-static void svc_i3c_master_remove(struct platform_device *pdev)
+void svc_i3c_master_remove(struct platform_device *pdev)
 {
 	struct svc_i3c_master *master = platform_get_drvdata(pdev);
 
@@ -1733,7 +1735,7 @@ static void svc_i3c_restore_regs(struct svc_i3c_master *master)
 	}
 }
 
-static int __maybe_unused svc_i3c_runtime_suspend(struct device *dev)
+int svc_i3c_master_runtime_suspend(struct device *dev)
 {
 	struct svc_i3c_master *master = dev_get_drvdata(dev);
 
@@ -1744,7 +1746,7 @@ static int __maybe_unused svc_i3c_runtime_suspend(struct device *dev)
 	return 0;
 }
 
-static int __maybe_unused svc_i3c_runtime_resume(struct device *dev)
+int svc_i3c_master_runtime_resume(struct device *dev)
 {
 	struct svc_i3c_master *master = dev_get_drvdata(dev);
 
@@ -1756,30 +1758,6 @@ static int __maybe_unused svc_i3c_runtime_resume(struct device *dev)
 	return 0;
 }
 
-static const struct dev_pm_ops svc_i3c_pm_ops = {
-	SET_NOIRQ_SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend,
-				      pm_runtime_force_resume)
-	SET_RUNTIME_PM_OPS(svc_i3c_runtime_suspend,
-			   svc_i3c_runtime_resume, NULL)
-};
-
-static const struct of_device_id svc_i3c_master_of_match_tbl[] = {
-	{ .compatible = "silvaco,i3c-master-v1"},
-	{ /* sentinel */ },
-};
-MODULE_DEVICE_TABLE(of, svc_i3c_master_of_match_tbl);
-
-static struct platform_driver svc_i3c_master = {
-	.probe = svc_i3c_master_probe,
-	.remove_new = svc_i3c_master_remove,
-	.driver = {
-		.name = "silvaco-i3c-master",
-		.of_match_table = svc_i3c_master_of_match_tbl,
-		.pm = &svc_i3c_pm_ops,
-	},
-};
-module_platform_driver(svc_i3c_master);
-
 MODULE_AUTHOR("Conor Culhane <conor.culhane@silvaco.com>");
 MODULE_AUTHOR("Miquel Raynal <miquel.raynal@bootlin.com>");
 MODULE_DESCRIPTION("Silvaco dual-role I3C master driver");
diff --git a/drivers/i3c/master/svc-i3c.h b/drivers/i3c/master/svc-i3c.h
new file mode 100644
index 0000000000000..b9e1dce4b2109
--- /dev/null
+++ b/drivers/i3c/master/svc-i3c.h
@@ -0,0 +1,12 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+
+#ifndef SVC_I3C_H
+#define SVC_I3C_H
+
+int svc_i3c_master_probe(struct platform_device *pdev);
+void svc_i3c_master_remove(struct platform_device *pdev);
+int svc_i3c_master_runtime_suspend(struct device *dev);
+int svc_i3c_master_runtime_resume(struct device *dev);
+
+#endif
+
-- 
2.34.1


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
