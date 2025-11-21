Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D7B9CFC29B
	for <linux-i3c@archiver.kernel.org>; Fri, 21 Nov 2025 18:03:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sYb4W/QUqIm1COvqQ95LiDY+pjWzId5ZYJWv0rzrhDs=; b=2pjXBvpBbI07ZU
	y9J9b9FiT7jxh/fCD/V+xM6JMFd7xHe+nqRIFOMtZxEsuAU4esiD5e+1qCPP5gnrtcpkcc/QvrbC8
	Frvpw31tAYljiBizmjkI6u/YdTXNr8rWBzJwiPHJle1CAHpsnVEpks6/8VFPExlPJR4fuwmKqcg6o
	f0KtkqtRimZvro1Vjhd+JQ3OkTswYaMCm1jrE0TTu7+lsQqbMNEQ0Og/6nRCC3h9ts+dMDJlwCLlw
	UriEQMH5lpKWXhhG+Snm8SFJ1IEP/Burk1Pi0IQ01p7Zv7uQqe2w4FU60Lo913x5i4FhFW8OXF11p
	Jb1IdPHAYeB9h83H52Eg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMVTX-00000008pJj-3ugz;
	Fri, 21 Nov 2025 18:03:15 +0000
Received: from mail-southcentralusazon11013001.outbound.protection.outlook.com ([40.93.196.1] helo=SA9PR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMVTV-00000008pIg-3bKi
	for linux-i3c@lists.infradead.org;
	Fri, 21 Nov 2025 18:03:14 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CeKVCLoDmuuP8dM2unCE/Q7IIP7eGil+U259MXerNPvf9Nc9uh7ZZHVG0VxDkReQMxfo0knNicmlyfWhBhx/WjUieHIPIkg7INEzSEPeoJu6dGy8D+MjPterWyZghKi4zcoIy6PofX3CAph99dBbB3n5ipnacAks2+Lyncq4x7QvKefCVtMbI1h3vN2lShh+8zP2w/Wb7cxbE25K8i6C+VUHR1lmismGrQHpDJGNecSnROmCHwzWp2lC+Lk8MdfS671aPrY4A4+NUT/5sf0+8f1IJfQuZhFW6lc0jELM6kvy/4xq5PcFW4IaX6T7yiXQcfPAg0stAF6RjVfrSuzYgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UIp0IfmdKYekXNJMpvU8Zns/88Weyx/ssLK//h805VU=;
 b=lHVRYfybbXG8OksFZmSMNDJBcTaehh99+UYRTGLD7Si+IPZ5KlgFwtw4ZU1BZ/eBe3iqhuboD+Ak1f6u96yLfNJq1viyEsVK1A4Atic9Kg+vwPjqBzAX6ukWCuUyXxV2mt0ctMnDAUJy7yUYmREq7dh9FfACER4+cec0NqaVZJciRcSR/l2nO9ebStPysqmXJ0vthz6HnucuuNPlYEXNDIKymzJqCZnthqARPZfigtAYtkX/ewLGsh80ao2AQLieHs1sDy/2IMYRr8rXl/DSTdnRnep1l6sloTfK2CHArufNIum6MdDofIyDIjQGFQRsL29MyeMbo7YgJa0Kaugrng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=altera.com; dmarc=pass action=none header.from=altera.com;
 dkim=pass header.d=altera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=altera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UIp0IfmdKYekXNJMpvU8Zns/88Weyx/ssLK//h805VU=;
 b=VFONOIPzEeD4uSwOr83XqmwqGdPmCnXyc7G3ehMGM4/fs7jbZiqIJQ4VeoiC2SLhCLpTSLYN7HGpJTmaCMciibrwSO1pIIPggIK5OJqXhIEko/E1nN73jc2aI7fX5uyb26f9iAPmg+6rJpjnwAk8MsKFCR4wAqDY+UcSCWLQ7jwGR33h/Ld+LNYYg09TDFIeD8d0MKUPe6SqKHezcQgxTP9ei01pghtagYyvKlMRGtNIqJqhnxAWN9sThqTtgsyoS5nl1p07PTq6XWU2sBaV73rncCNR4n2V0cD8XQ4z8SHEcWiC5oiY+gFrQfawB+xEIR7XNDgfgCtuOchw9ekRBg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=altera.com;
Received: from DM8PR03MB6230.namprd03.prod.outlook.com (2603:10b6:8:3c::13) by
 MN2PR03MB4926.namprd03.prod.outlook.com (2603:10b6:208:1b1::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9343.14; Fri, 21 Nov 2025 18:03:09 +0000
Received: from DM8PR03MB6230.namprd03.prod.outlook.com
 ([fe80::abad:9d80:7a13:9542]) by DM8PR03MB6230.namprd03.prod.outlook.com
 ([fe80::abad:9d80:7a13:9542%3]) with mapi id 15.20.9320.021; Fri, 21 Nov 2025
 18:03:09 +0000
From: adrianhoyin.ng@altera.com
To: alexandre.belloni@bootlin.com,
	Frank.Li@nxp.com,
	linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: adrianhoyin.ng@altera.com
Subject: [PATCH v3 1/3] i3c: add sysfs entry for Device NACK Retry count
Date: Sat, 22 Nov 2025 02:00:39 +0800
Message-ID: <6ad1cc6cc835ddb01cc179f91cb9a8bd2eb5153d.1763747151.git.adrianhoyin.ng@altera.com>
X-Mailer: git-send-email 2.49.GIT
In-Reply-To: <cover.1763747151.git.adrianhoyin.ng@altera.com>
References: <cover.1763747151.git.adrianhoyin.ng@altera.com>
X-ClientProxiedBy: KUZPR04CA0028.apcprd04.prod.outlook.com
 (2603:1096:d10:25::12) To DM8PR03MB6230.namprd03.prod.outlook.com
 (2603:10b6:8:3c::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM8PR03MB6230:EE_|MN2PR03MB4926:EE_
X-MS-Office365-Filtering-Correlation-Id: 33a3d5d3-beb2-43f4-b684-08de29283a4c
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?jXv2NrlKxs7Wblsk01UFi2Ga4DiqO2EXiJdKaCw/gtrtowmeyvxG3zHKm6l3?=
 =?us-ascii?Q?QVHYsxQ3K0BIZiPgbxYqav7SBr44fatNh4SovCSQt2voxmkB8i0ruwF3hF6m?=
 =?us-ascii?Q?n7orqvFXqOGr4Wk23cIUAXx9cwUADiWYVWBM8HXZyRb61LWeWx2q+j3KrKOs?=
 =?us-ascii?Q?De7LnSCkr6mrTW6kasX5M4KFTZKg7A3Dmo9XbQWnipNT1n4UHKaAxnOMO7ti?=
 =?us-ascii?Q?8Lqsi+ART4vAYT2MuABMoKb/50jdL83yoG0dE3caS6VqEYzNLogMcm2vaamK?=
 =?us-ascii?Q?SVPTl6nVCWPFMN+LL1g/eQvI/mdcK0DAEOMvNvMVokHj67Nx2Qb6LacpFtKU?=
 =?us-ascii?Q?vCivnU4cMAHLDJsDcdoEFWmZhmV9srYpjiD+0km+ouVLS3JRwmh2GQEmjS1Z?=
 =?us-ascii?Q?wwQM3ECKJNuP0Lx2o0UBTXcdOaqjDW4XSh+PtYDjCqAvswjWQ3OwdjLntgIC?=
 =?us-ascii?Q?6uqF1gY7lM9fqu1QDXlanMgeguJHmrK4483/7dUCvFPMcfSdFKKdVggABEcR?=
 =?us-ascii?Q?PeBjjiAO/xudQWZZK+MICWusU+bh9FACNL5pqjoO1NUrGeGvlmk/F3tndsrK?=
 =?us-ascii?Q?bsMfFTvwas0/LHVUl44fUT/b2zu+qKjyCE1tQmYJrAu06rZ3vVnBPQP/e1/E?=
 =?us-ascii?Q?3JOm9t+TXe8xFA2eUcXomsIBSG9B3j28RWDK65RMoqpkYluX9FKl06CQlp5l?=
 =?us-ascii?Q?lJYwwvnpt4CDfdlBeMzOLsTgX2YFyfdpW+AsBOKwU1bNNjRILtE2aejC6vGx?=
 =?us-ascii?Q?oafhmh/VZOYMT1bYoSdAa62bmDBD3w+uXcUaN1IIZqqgPMkZ6lSnP0zXTNuU?=
 =?us-ascii?Q?QuBj0g8HMzyY+n1Q8eqQpgrJTnvpsSB7LA1Z2oWDGer5fUESSWUXh82oS9UP?=
 =?us-ascii?Q?mmkV3Way+U8Thm/cJRAXbcnXLiDTtmUufADSm50BbPJwXcrjXjQMN7AQTcjz?=
 =?us-ascii?Q?2jBM4b9+DLg/fZdnITgDkF6gObul4lc6vVZxI3cEuHpOHrd9pcwMnOOVJt3W?=
 =?us-ascii?Q?znK8nFnyyOXOagSbZip4j3u8rY8BF2DCFIqpI7DnJG8iVTZvjjBm9LLKSYqE?=
 =?us-ascii?Q?eJxDpygGyQ8uUSLMl+31tByAQvC+ecwH1VzWdmgD4lHkqhHqr5SGjbJXUECF?=
 =?us-ascii?Q?KY/yIZcQ+prPg9CPz+aBg26qJHA9ZtAmTERwhDqU8mlhvpHBg6MTbKGVbily?=
 =?us-ascii?Q?5TvI3e3RBdoGOjOSCkhuo71OAGje5ylQ1ZV1a18X2/k4z+25JR2vNGGgA4Jr?=
 =?us-ascii?Q?X2rqFeZk+03r7QgL8qpKUQ8RiR/VhXtehyzih9Mg0N/CneXceVQYWCjn0qkp?=
 =?us-ascii?Q?j27IkBg166UnbHf5kJzVqomLY3m/6SnIyed7mVeRJeec0zme2ZWSEzysTxkD?=
 =?us-ascii?Q?bIwUqyHuO3ppdKlG/8R5oxu/7yUlW305PcALKt5kjUTPaaF8A3DlBDPg+xRO?=
 =?us-ascii?Q?/ef3dV5uR6afClFqZkHglQormpQEQkHg?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM8PR03MB6230.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?LDM+Ft0LL2KA1kyzMQU7HUj67XJnFMDhVqdO5DWr+4lIaffuq9621yC8Fav9?=
 =?us-ascii?Q?8Pq5QSt7yoLFlFfmhBzeNLvWsdSSgJ8qKliLbT+gH2vwobvyXcd2+WJTx2I3?=
 =?us-ascii?Q?ZCjNvheDtf10ffLEYd1NNrrQG7AU5vqaL9sLAasgLjh73+uDGGimejl87wfZ?=
 =?us-ascii?Q?ZDhrT3e3M0HypHyNw42uv2lJyPrc/sXsS3Hl9+7gZonPkNVQ1nulqp+3QbGu?=
 =?us-ascii?Q?qcBy92XcPUzXbpk285Log739kP7uk6sShV9IodQ/j4UgoPVrDzLALEmYka8h?=
 =?us-ascii?Q?p6RwD55/c9a7I+5//1GcIeTiCRVav8o+PMIP8FYyGD+2Th8ZqDUPz+QKN2x4?=
 =?us-ascii?Q?JXI66r4Wysa0D2en8iEp6QslchN6P08dypM9HUMbGoeMTbjo9PXO3Tmukjn+?=
 =?us-ascii?Q?DVhmy2utklv6Qi4tN93LrfDFGp5bXl9f4e6QPKFXJ+UnwHPoipa2DPBCz9fS?=
 =?us-ascii?Q?a4urZev4s6aoRJYJdsjgHgjPTzZdS2Thh7cIqFf0zhteLgkG3xR5Zd7X5Ipf?=
 =?us-ascii?Q?U3dRq3EdU9s3OANJFtKl3Y++BgQeNcx1X577n0VRB4pJUOma4mA050fKI6jg?=
 =?us-ascii?Q?ebk4OCzRtYOxQdvUVuNImYqBdLnfdDaJntaGwMwpsOYsVTa5o8z1NTUJHssV?=
 =?us-ascii?Q?/9WWX7bovObjxkB3JFWLyHHJOzeHs4zfph3NYzRbJ1/RbZE9SOLVGAKka3Cf?=
 =?us-ascii?Q?avGSeI5Kj67UIBwc0xRgxw0Y8JsADHH6ldcQb0zXyM07/ffy2+jxrNXAgqBq?=
 =?us-ascii?Q?DW9sh9lr+jd5YEkwzq6yGOvDEiYaqURpHHDtFQgu58zHWFbM/YJLZRGz0XeZ?=
 =?us-ascii?Q?7RiSEkNpNVqpuRqLrvmZ1XYZyFikXTpdPB0pQR1hOSdwojFYXBHhy3sTxI82?=
 =?us-ascii?Q?/AFXazvSWi180iUnR9Hveop0JEuIgH7drOs6Y5FoP7bkOekfN0EzPv6njvnR?=
 =?us-ascii?Q?2P2tSyJsvkLM1NKUSrLFzNM3EuuVpDulDGfqRm1A2X/02Tjc3wLyjrlVXDNM?=
 =?us-ascii?Q?sQLb383sNxRk6e+Ulqy7sAebEdb18m9AxI7FKuImli6PsoY+ohR0tEz1O8pd?=
 =?us-ascii?Q?wHx23akrB1ULswEvD54bNZzozyHjfGtL8n0fRVhG5wBOFzCIh/0fiOwP8rDN?=
 =?us-ascii?Q?qAF8HxCDmrs2sXV8kC5q7Jj/bTqTauFS019YkKPU676MwuGYNjRVWob0pIoM?=
 =?us-ascii?Q?pHkdC7HjFkKh2vNvA7CYIvBJC5+UMhXQq0758kdHLK4pIJu12rO3/pshb+yj?=
 =?us-ascii?Q?pJau+qp9U1lUJeExBMUJL6FiicKlwNUtz5MOPtCWcxH2i996x5vfTE5NYXQu?=
 =?us-ascii?Q?af2v3kNq/adpAIawRS9G59HiCB1Q/65FZ+EBcic9bmZatYJv488JHJ1Fjwh1?=
 =?us-ascii?Q?WXHMwyulO411OrM9zMJIO9xAh9fpiKoBwVXXFiuKzL2USuuZgVPYHGtwM9tA?=
 =?us-ascii?Q?FbxwRglIc0xXZ3htmNQRbIwMDGQUZWL7DLCGDnGwMIPW1mA1KdYavvCJ8krC?=
 =?us-ascii?Q?WSjOWmbBsN8dRYzBZtrv1MxED8nlD5BVdUHvz0a0jNaLqfCkyl56/iqBIMxo?=
 =?us-ascii?Q?2TgEDOmo9ohR/T15MrDvwJRCI2JqI+I8roF/L3xjafF0Agntt/H+vRwYSL65?=
 =?us-ascii?Q?pg=3D=3D?=
X-OriginatorOrg: altera.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 33a3d5d3-beb2-43f4-b684-08de29283a4c
X-MS-Exchange-CrossTenant-AuthSource: DM8PR03MB6230.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Nov 2025 18:03:09.0348
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fbd72e03-d4a5-4110-adce-614d51f2077a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lOoIdRrXVDSMBGXtBivfgP3bL6XgCTBresqbGVYuPjjj9Ms7uZgKm22u1v4oqY4KvvBGs8q07iZpv9/X2lCsNtrNcZ48g+GByY2CMm+YXdk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR03MB4926
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251121_100313_897978_4C279CCC 
X-CRM114-Status: UNSURE (   8.07  )
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

Document sysfs attribute dev_nack_retry_cnt that controls the number of
automatic retries performed by the I3C controller when a target device
returns a NACK

Signed-off-by: Adrian Ng Ho Yin <adrianhoyin.ng@altera.com>
---
 Documentation/ABI/testing/sysfs-bus-i3c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/Documentation/ABI/testing/sysfs-bus-i3c b/Documentation/ABI/testing/sysfs-bus-i3c
index c812ab180ff4..0b8a0c223f4a 100644
--- a/Documentation/ABI/testing/sysfs-bus-i3c
+++ b/Documentation/ABI/testing/sysfs-bus-i3c
@@ -161,3 +161,15 @@ Contact:	linux-i3c@vger.kernel.org
 Description:
 		These directories are just symbolic links to
 		/sys/bus/i3c/devices/i3c-<bus-id>/<bus-id>-<device-pid>.
+
+What:		/sys/bus/i3c/devices/i3c-<bus-id>/<bus-id>-<device-pid>/dev_nack_retry_count
+KernelVersion:  6.18
+Contact:	linux-i3c@vger.kernel.org
+Description:
+		Expose the dev_nak_retry_count which controls the number of
+		automatic retries that will be performed by the controller when
+		the target device returns a NACK response. A value of 0 disables
+		the automatic retries. A max value of 3 can be configured. Exist
+		only when I3C constroller supports this retry on nack feature.
+
+		Valid values: 0-3
-- 
2.49.GIT


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
