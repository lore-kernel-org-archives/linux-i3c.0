Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD730D10374
	for <linux-i3c@archiver.kernel.org>; Thu, 24 Oct 2024 20:44:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=79nPBanY/iUtN3Y1D8ht1uKGQTgyxuWAtcztUHfyAkY=; b=z+6J4R1cslZ0Wg
	6AlehjA/u9ApCG46zpxUQG5qXs47E0hhOadElVPPrTM+Yq7G8us0GS/99GzgbRMCyz8VAu+Mg4CzV
	yd2xiXuwvrSe6SjJPOIJl6Bse0j099wMy5fgDmwzXZUrc+YZb1xs0dVMOBIA4OASZeh6rUILqtGfM
	zjXFxcL8Gv5aYrGLyW2Cn0ycxeLroUgZH7pNykMjnfREOkiXMz+bIxTj7b8xQR8gl+xmMVlxhzq3P
	1a2RfHcJDXDqRm3YWdB2z6yWgUyER2gxnMvxUwDqBItQc7DW6zE9+GL2W+AGvooBqd6PgoS6Ha5k+
	ZVcamSG0o45juMkj/UjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t44ge-00000001lpk-3eIJ;
	Thu, 24 Oct 2024 20:44:04 +0000
Received: from mail-vi1eur02on20617.outbound.protection.outlook.com ([2a01:111:f403:2607::617] helo=EUR02-VI1-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t44cB-00000001kd8-3eJr
	for linux-i3c@lists.infradead.org;
	Thu, 24 Oct 2024 20:39:29 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AIptEMRhudJzYW1ZSwFGueQhXsvbjj7dHLiE9k+jc9IBlYcyW74LjzJm7N6aGEY55kyq317b5XR2JM+E8GDqg3l6CB1YYUWpXnsyA+AEUeuz990A9h2NbFkSaZR7H80avj/6v1NXxdKyN10QqpwsplFVF5YItydoNgqcf7pl/MkG4E/e1sslKJVOg9zPdfAk4A1SV1mvrCkhwMEAmMTeGn/YrVgvKO/3h19YWdImSXqRMjEpMU0y7tOFLsIhpPSUoPbD2k5NhHqbS29DDsKqTFY4SUinkB+UZPPExxunbu67qotFrIvJ1Xg5mV2RZ2csMlQUD6wJ7ogFp+fs5U7yug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/vQPPxTEls1kGr/hulsYN3wM8+QPezxBGdHme/vicOE=;
 b=aUMdFBfDB17gKGX9YWFZdR46tZNhad+c34aMw3RYzYXamecfZcYYNqRWGCQrEMPqVlDq6iCJnH6Vbj/fQYggKkOcDYSzIsN4T0fWdl/CDr760wkrmvUB5kLlMLc0SAxYSKtoQ+ynoRhOwnKBkGzLtiq79ICgshXcWdkHUN7NPue1GtJFes0aI9EoqKafT7vEG0Tx0RakC/ey8KKmDR/s4WSHm9YNetFkfhiNNkdhzXqc2hdsnHNnCCAbapByDZ1tDqLJPPMoMwU4rfjv760KTSJ7OTkSuV8F3hQmKx6mHYikAMPmwmwB0lI3F057PCWvUQ5IBXiFq/CaAbD0HBxE+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/vQPPxTEls1kGr/hulsYN3wM8+QPezxBGdHme/vicOE=;
 b=A8gwDkUiQmwEWTT+ob0ncjVTJCyw/tO9EwAFOVkvXHZtyQpwo4GIdHRIfhy7t2wE5YplLyMPh4eTADAGgTUdzOi3rjBw5RxqRYKDacPWrboeIJvUmaz7GiZc0CmiNRjOiRIQ+mx81BsC9RwZfGkDpdNisqaZahHmJBpbagKrlLTQN8ACOdwiMJhzlrXkt6M7tB7J3QHQ8tpVt7jSwa8MRRivOXXD7SC3s6U/44fVp5fIdO0yX21ZLSVSzj1gv4EE8oxMuRxzx8gaxDHxihKYWRMRh3dsqhgFoWL5uaHjmTKaRNYaSWYyrIicghyv0E9275hGP86TqTldMmwWYMQJOw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by PA4PR04MB7517.eurprd04.prod.outlook.com (2603:10a6:102:e0::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.21; Thu, 24 Oct
 2024 20:39:16 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%4]) with mapi id 15.20.8069.024; Thu, 24 Oct 2024
 20:39:16 +0000
From: Frank Li <Frank.Li@nxp.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Conor Culhane <conor.culhane@silvaco.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Clark Wang <xiaoning.wang@nxp.com>,
	linux-i3c@lists.infradead.org (moderated list:SILVACO I3C DUAL-ROLE MASTER),
	linux-kernel@vger.kernel.org (open list)
Cc: imx@lists.linux.dev
Subject: [PATCH 1/1] i3c: master: svc: Modify enabled_events bit 7:0 to act as IBI enable counter
Date: Thu, 24 Oct 2024 16:38:55 -0400
Message-Id: <20241024203855.1584416-1-Frank.Li@nxp.com>
X-Mailer: git-send-email 2.34.1
X-ClientProxiedBy: SJ0PR05CA0149.namprd05.prod.outlook.com
 (2603:10b6:a03:33d::34) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|PA4PR04MB7517:EE_
X-MS-Office365-Filtering-Correlation-Id: 2178d541-88bf-46b3-e76b-08dcf46bed36
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|52116014|1800799024|376014|366016|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?BW98c0kcf5kZuv3/jZWiRMSNBtq6sapd/8xLVUATWpF51HvuhKADAhjOR5C+?=
 =?us-ascii?Q?MdzzNjiEStgS0dfVZdTpwX7vkMh8M6btZso3fUXZeJFWkdNouE6fTrC58hCi?=
 =?us-ascii?Q?oHiM1K78Tj7iPqFdkfzB71QL+tGRA4pwb0tOB/Kjq1uf2nFrLqQCMMYD69Wg?=
 =?us-ascii?Q?u4mV9C2+nDwgp6p9NyeQ5atcC/soh8oThXRblHQ8pdQZU89op7FW2GVTrN52?=
 =?us-ascii?Q?8LX9yETUcM3VkyHZ777qpxdPFo3TzxU1otbDqJtEvUM7ZWjjw5uXQXdd6rFw?=
 =?us-ascii?Q?/x2va+F70HL7QqDWIz1zHg9oGckfbUiG7uZy9O7tLTcsKpv1zPy7wcZaDf9w?=
 =?us-ascii?Q?3cn/G7u46l/HrNzjICeAzHaCAsJCtpD2rfP3pkPpPJyS7QwPT8uLbtVLJiDM?=
 =?us-ascii?Q?5xIuS3jZT+Gcr4VOjppZ3KLm/0t2JKAEexam2/QJMVNfA5w4ypmgRRL/8UGs?=
 =?us-ascii?Q?+pM3Ha9B/CfqdFk9PtVG1U/fg2j+iYV5zu6HRwuNlRWPidTvzqNEr4aQ7XZN?=
 =?us-ascii?Q?AFbw9N9YrglTAVgaFzW9C/3UjNovlwZjnyAC2YxYjX35G4JAjD06hMzjbtME?=
 =?us-ascii?Q?89lTT2gOx/O9r6FpAr3FIcrxcUUeXav2ufO5nZjNbHObyZhIdqkSSgcnA1pA?=
 =?us-ascii?Q?RmgmJI4S+uKreIGeysG1AwRD4ZTpIzTFGgptmDqZTJ4/FGhWjRfS1DMkA/mS?=
 =?us-ascii?Q?YhyllmFDisDd4dZ4SISO54UavUXZfGTDvftipECP1/hnLGWiI8enjewvXBt8?=
 =?us-ascii?Q?EY2L33oOvUehrnr7l+ED0Fsjob1kFExbqbJOKeWRO2FSVnwWUYFkV4HtWKtn?=
 =?us-ascii?Q?HLtROtU5kcElbGHZbCKMGESMKwhYLZXfBSzBCwDz/BbyBedulNyFrLHRo1cL?=
 =?us-ascii?Q?9Stj0vRdvIJFfdrNP034bFkhH5TN9MPjeZYNMPFa/oLBAEw9cFi33BGtE34Y?=
 =?us-ascii?Q?Ebq0A/7a51nSL2n20Nx/fgQXGOh+hL+e2ySzOlXcer/b3QfBM+RMxlwbLsoR?=
 =?us-ascii?Q?fyQdk9HFxO0wlZPbjfQH91iwxWJK+ouSVpCek4ZxHG31nI6VfIK33b6qJSjM?=
 =?us-ascii?Q?xDxRi9AQFHER3QJxW4enhQQxkP5rivUa4r7Pu6lEz23KTGMp4WrkPkRhgcCV?=
 =?us-ascii?Q?mTV2Ds0Vdn1ZeFPKRr0xOK/EMpZ50shC/Ca+3LRRMEHjuJ9haC8hjf8aqvYH?=
 =?us-ascii?Q?6194C/9kDWzA15C6OmXbEr9HIzC3P0TOcjCGCljittkmI5eeTVR6c/gUabH1?=
 =?us-ascii?Q?Ptj169ryclLdmhCb3jBJ8g/eC2Oo53GJXiTy1T8fVc0urNRLweCJKc7T59ag?=
 =?us-ascii?Q?vxLYhDd7imKJfO4/xNSLVPMGPp2MLhXs911jZc/xqku9BKnwC7yHycrNMpJL?=
 =?us-ascii?Q?IISnxy8=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(1800799024)(376014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?vthxoBHl/7wysxzJaXe7OYSJZ7P918Pz6uVfvSicGUEXh0LiEdjnH2VQWOHe?=
 =?us-ascii?Q?p50yqeN1wZBBcNG1IJAXh6+mF3477Oj6GMHeZAz4MQXZlz+95kJ/A5dnt2u9?=
 =?us-ascii?Q?7b04k7JVhmq68zyR/cA1kjqJXyhzd8QzmIDblV2VU2Oz2ZflkcfoFYNR74as?=
 =?us-ascii?Q?Hcs6BYDGvHfZbLCJQ/ND+m90HW9ei/PPjH6JlJFKOjrktZJ3eBh5x6uVvwRM?=
 =?us-ascii?Q?Z7eYBS88kW00oCW2Lo9HQIDnPXJILeVJFpdZdiHWBe57i4NM6q3akSLZRlkz?=
 =?us-ascii?Q?UZtJSNJ8PIwx7ODG8wrSrgne/rMHzDSI0w45fp9oJJcn2bqsDuI1zhV39cH/?=
 =?us-ascii?Q?nFJhqo4eTdyzVOs2zw5nAVrQyobesb4ncL+ADitTGige01q3Zc3QX/HRHJzB?=
 =?us-ascii?Q?D8EMw638F0pxcqUa7yo3Vsf3SPybqS25cet6ZIFRx6rMiaAZxuCXpLCGefTt?=
 =?us-ascii?Q?pDuk80Rwl+Ggn5Ur5fhqza8H0nUUgz/EerZNVQTNhHbIifcJQvRt8bhlS/fa?=
 =?us-ascii?Q?1yUy3RF5hocJCHbcuuPDCpp0hVNSkvQyX19oeupZhtev3FRq7WUtTfX9g+h1?=
 =?us-ascii?Q?BkdFomLPEshgvoDWL90BWWCaQxJhPmBJj8GZY2kv8f7O8pmjknZz/JNZdX5X?=
 =?us-ascii?Q?0ScNOcIoStFtFK4vKxXlhG3MbExrzQkYMGOTAINdr89v+dxsKXY0KXdBUY6Y?=
 =?us-ascii?Q?sJAzEoedpySXqrsJq4fwIuwmxOe0i0k3Rw/nackvAqYDWteDRq7okH0amz/6?=
 =?us-ascii?Q?qymzu05HzLadGyIBxNBzU6UDRnhoBUiai8LSVZIWeJviOHtYl0gXTC0KNFVy?=
 =?us-ascii?Q?btGzarCjhZvT+8NjEl/cTdiDuNIIZZM/pxwq+sfHvqXva+osDlfwmCDiO312?=
 =?us-ascii?Q?Up6YRW0i6m1X/XirhTeyy4o5WXkXo/jIveGMxOZJDIAL+wQMkDgQejbpvRSi?=
 =?us-ascii?Q?UNUMRqqxIV5nwup3vsFy+7pY/o8qvrfN8vJr0p2efwurhF0tNvwP70caED6l?=
 =?us-ascii?Q?y5QwncTagNAxwFJpc1PHGDoREZzSWm7U8MALIxKGlpUiraoUzuqrG6OGV7cz?=
 =?us-ascii?Q?TwFS4ILVkKmSUFrk+nQSh0HkF0Qtui+TvCN84859OETVjeaV+FhYWfRfooRv?=
 =?us-ascii?Q?/U3N8mA1emb3hQ/Dky6HLQnTZs6CZcctxKMeKsvq2QN0GBBzp/42Wyqnt6kP?=
 =?us-ascii?Q?jcdi7MW+yTHLsGuw4jNBiMflB2NGM6xHZ/ejXWj1ntBJhAuDq2elkS/zCX04?=
 =?us-ascii?Q?/uNOMc4F0uh8cT1tE5rhLP7Fg9YHIMdQobDKdCkWgGYK6zysPMpSEnchYCJ0?=
 =?us-ascii?Q?9EsDHeXP7Sr2zWYZe0UvsAiGr/jlFvHvZ3BAzeFm4IoX5/yTAQKAdFGtGU5W?=
 =?us-ascii?Q?id1wqwvt+jjSnwaRSbHA52pCxxIm2fUxuAwR0LCAJyX96Ize3JolDN0Pobx6?=
 =?us-ascii?Q?L/axGfsUHT9ultChyFvmjTHuJWchCu+FnUAIBgmUjfCMxxb6nnO0hink6Rcu?=
 =?us-ascii?Q?4+HemrVOs1y3ncCa43mGGT3jSZcyVaO9st0Azaeuh0lfeLFpLoBWVs6pzOeT?=
 =?us-ascii?Q?pp9uRZTsUCy9U6OSfvI/wl5f1QmQ+LoNKx0I4pa6?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2178d541-88bf-46b3-e76b-08dcf46bed36
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Oct 2024 20:39:15.9677
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: V93Gx/SoT3hBNfrfIqWkkV/kaZl0AQVa+5zflmiInNgX6MDBp5oHs2cu0dOcCnLkvWqOtj62fsTR1CjUQqlzww==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7517
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241024_133927_942852_D42E5E25 
X-CRM114-Status: GOOD (  11.14  )
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

Fix issue where disabling IBI on one device disables the entire IBI
interrupt. Modify bit 7:0 of enabled_events to serve as an IBI enable
counter, ensuring that the system IBI interrupt is disabled only when all
I3C devices have IBI disabled.

Cc: stable@kernel.org
Fixes: 7ff730ca458e ("i3c: master: svc: enable the interrupt in the enable ibi function")
Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
 drivers/i3c/master/svc-i3c-master.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/i3c/master/svc-i3c-master.c b/drivers/i3c/master/svc-i3c-master.c
index d1ebfba3739c1..66fe0fc12c897 100644
--- a/drivers/i3c/master/svc-i3c-master.c
+++ b/drivers/i3c/master/svc-i3c-master.c
@@ -130,8 +130,8 @@
 /* This parameter depends on the implementation and may be tuned */
 #define SVC_I3C_FIFO_SIZE 16
 
-#define SVC_I3C_EVENT_IBI	BIT(0)
-#define SVC_I3C_EVENT_HOTJOIN	BIT(1)
+#define SVC_I3C_EVENT_IBI	GENMASK(7, 0)
+#define SVC_I3C_EVENT_HOTJOIN	BIT(31)
 
 struct svc_i3c_cmd {
 	u8 addr;
@@ -214,7 +214,7 @@ struct svc_i3c_master {
 		spinlock_t lock;
 	} ibi;
 	struct mutex lock;
-	int enabled_events;
+	u32 enabled_events;
 };
 
 /**
@@ -1532,7 +1532,7 @@ static int svc_i3c_master_enable_ibi(struct i3c_dev_desc *dev)
 		return ret;
 	}
 
-	master->enabled_events |= SVC_I3C_EVENT_IBI;
+	master->enabled_events++;
 	svc_i3c_master_enable_interrupts(master, SVC_I3C_MINT_SLVSTART);
 
 	return i3c_master_enec_locked(m, dev->info.dyn_addr, I3C_CCC_EVENT_SIR);
@@ -1544,7 +1544,7 @@ static int svc_i3c_master_disable_ibi(struct i3c_dev_desc *dev)
 	struct svc_i3c_master *master = to_svc_i3c_master(m);
 	int ret;
 
-	master->enabled_events &= ~SVC_I3C_EVENT_IBI;
+	master->enabled_events--;
 	if (!master->enabled_events)
 		svc_i3c_master_disable_interrupts(master);
 
-- 
2.34.1


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
