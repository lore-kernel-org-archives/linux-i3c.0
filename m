Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B45EED3B7DD
	for <linux-i3c@archiver.kernel.org>; Mon,  8 Dec 2025 07:14:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8eG2kAB1g05PZOL1oRbG8U6jbgH8k5k42XY4k93Xa7s=; b=XEgt6mhELxIEhm
	5ohVAGsiLZh6FSkH6yN6BTR2+nXWqoJgDmiMsqQRi1uaN08a2Rp04c00F/CeaXvS7lO8Xk2685NgZ
	H9DSkb0WTgYNgoKT+90uezrdKberHcg97LS4E3PisDJ65ssdS4qZWJbQM+Pa551/8xUcU2JLOxaqm
	T1LIj4tbzc8z4s/fC28EeaYmr9BD0D9fgtD7MyFGVgyQHgZROoNwS02v2ZyTtwdKnPEDmBScwqeHq
	W2mXDBmRyJC5Ewbsi8dMTNonOryeN67zYXm5gBJu2BMIAuITP7PCIZqbjNckgjgQZhXG08iQejue0
	6RU4WmUkix1WohGp7i+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSVRa-0000000CjeK-1yvE;
	Mon, 08 Dec 2025 07:14:02 +0000
Received: from mail-westcentralusazon11010030.outbound.protection.outlook.com ([40.93.198.30] helo=CY7PR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSVRY-0000000Cjcm-2TmQ
	for linux-i3c@lists.infradead.org;
	Mon, 08 Dec 2025 07:14:01 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TNO52/0lIWDEpetkMlmtlz7PwF94VwllBHZpWmG/5MEX5nrR0Cix7+4XiVmElThAVnTmHctGVkob0l54eRSRFca0CzVDC/brV780CKYixlm9wshy2o3RPHGT1yQ3MH7IGjgomDgmJKXliTiDeTHqbjEH+GWR+HmHQDEX+B3m2hftHknYGwCA1d/dKa9oNF9HLWwF87sgX8pKDtDou2BWeysyeIcY2FtnUSPAnEg546rrUgUYxbyOLeJYcj6CO72iFxbiozMijFEg2uuxRfXoSK6cRgbdE4xV1O4pI9uAFvav46wPFbo5E/HtANxvgYzZzDqgUm+8DXFxGDem7Tc7fg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xaEm0zOzBn21jy0g8I48vBFSxKXMaKvwGSbcmsiaP+4=;
 b=Gj+2Nw0Cojwd7fcT5v4dev5OzVAi/bIMR0WvuJCVGkLKzhkiv5unXP9Ym2lA2IlFYdi06Ch0NTqOPIt8kYHFVcFKrKUTQDu//KUhIvYYsYeIsMxQCi48j7k4zyCzxgVXm4YKUUIhIewAvfI5FZPKrygaktN3/H7t5RIPPSxPPUVBGt+VsJHV3gQKDGUXyhHXwl1NHBRaJNKowIa7Rwe40cIHuKzEKv+0k5acBn7ML6EritCPILtjm0DtKkSSH6CPbpVkGSgKFN94e/0R85anveYnmZzuv4lH0foIKJ+TZuaYf6LiZQatX0J9tii70hmccS5O2sgNT23Zi1jC5CfjGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=altera.com; dmarc=pass action=none header.from=altera.com;
 dkim=pass header.d=altera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=altera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xaEm0zOzBn21jy0g8I48vBFSxKXMaKvwGSbcmsiaP+4=;
 b=r6Wn2xTWYTd64ypIQziikuq/GHj6iFjQ3xiMojXYZu8tHUT826ZgC5qZD/z3uGJng9xUUaUqHc6JmHSRZEC8Y/eY4hfyLKQ74CEbDuR96qMJsZ3kjo/5q6QoCxHHVUATaGYi3IpcnrSzDFsKFg8TQSE7noHRvIHJnZGsDfH86CdrB75eGItKpRpUPGrr0PtHztjephhjxLPfjepiQBjhVMHKrQOlSg/libPooMqpGLjT9ZAXZQZb2w6lONrCAWx+9rxFHXvNmQdw6wsCrDDKOH/fYowTcgzkxs6Nc7G57vElDr1xnSkA6B5MkhvKwea9+UR5nQCuiRdyWQBDE/o9jg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=altera.com;
Received: from DM8PR03MB6230.namprd03.prod.outlook.com (2603:10b6:8:3c::13) by
 SJ2PR03MB7475.namprd03.prod.outlook.com (2603:10b6:a03:55b::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.14; Mon, 8 Dec
 2025 07:13:54 +0000
Received: from DM8PR03MB6230.namprd03.prod.outlook.com
 ([fe80::abad:9d80:7a13:9542]) by DM8PR03MB6230.namprd03.prod.outlook.com
 ([fe80::abad:9d80:7a13:9542%3]) with mapi id 15.20.9388.013; Mon, 8 Dec 2025
 07:13:54 +0000
From: adrianhoyin.ng@altera.com
To: alexandre.belloni@bootlin.com,
	Frank.Li@nxp.com,
	linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: adrianhoyin.ng@altera.com
Subject: [PATCH v7 1/5] i3c: add sysfs entry for Device NACK Retry count
Date: Mon,  8 Dec 2025 15:11:16 +0800
Message-ID: <35bb0a3cae4664dc423ef57a1ef3ebcb378bce00.1765177110.git.adrianhoyin.ng@altera.com>
X-Mailer: git-send-email 2.49.GIT
In-Reply-To: <cover.1765177110.git.adrianhoyin.ng@altera.com>
References: <cover.1765177110.git.adrianhoyin.ng@altera.com>
X-ClientProxiedBy: KU0P306CA0060.MYSP306.PROD.OUTLOOK.COM
 (2603:1096:d10:23::7) To DM8PR03MB6230.namprd03.prod.outlook.com
 (2603:10b6:8:3c::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM8PR03MB6230:EE_|SJ2PR03MB7475:EE_
X-MS-Office365-Filtering-Correlation-Id: a13d9f50-f807-47a2-83da-08de362958a6
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?FSVByePrutGurq5nW6uqhByQn0ibOn1ZF0v0sgyVjpWBoEhZT23X7LRlX5Pf?=
 =?us-ascii?Q?BkSraUhkMeu85HI42X/hzvIWxwhBikzabNt+VhThGAWTEpI3pSOK8wHB7bvP?=
 =?us-ascii?Q?uC0YccvCtaIndbQsZ0AUzDaq1sp78ef1K24oIdIjg6pEYXIQ8gx5gzDbea4Q?=
 =?us-ascii?Q?RoxoQIw3q2iJjvy9IvNnIROyM3ucPYD8DJpxjFtoyPH0Db+DMh8r86fjjoCY?=
 =?us-ascii?Q?1oHTHrPCxtOxRkSFDIVrlIl6V85DRcPDOi+WeVpAMfjY3SRRbmue2rMr3Z+c?=
 =?us-ascii?Q?D64hhYx6JxcRCVl4HbYbKO9UH85B3thDm/4uQUhbV2MVQReSH//Hm4u0pse2?=
 =?us-ascii?Q?l/L5z+MNDanCYxEAaa+4NW+fwyY/i7nfJsVPQTZ43SAoTOZjuV+KaZA2W2tO?=
 =?us-ascii?Q?vVD9hoy81/Y5/IIs5veer/nqZOP95oQDaXCju/nsoXcqqBDo+l5MzDShBE67?=
 =?us-ascii?Q?sczy33wtW9Hta+WrwEVc2pglyccHmDd3jCpIk1tlfgx9q1SoTjxkIZPj1lBI?=
 =?us-ascii?Q?wiQbpq8ta7YMwD5NWFEEEpmkdxWx0DFWQpKC86Eb7IExKZ4CeLk9uxIvo2GO?=
 =?us-ascii?Q?B3WuPY6cX5lyLA6XZm3W8Dnog3I0PmGU+IsT2Igmt040IKzx2Yg8hjwITeL5?=
 =?us-ascii?Q?oY67B/NNDr0P6L3qWufX+xi6d0DMIJ2pLmLlQSXlXkFtXxvtCbH9m4kS1Wnj?=
 =?us-ascii?Q?egV/JY9XPzAREfYj0sJL2CjTHAtlKD33ubG/2KbB74RDZ9ja/qrK944KKBLk?=
 =?us-ascii?Q?ErwuaF7K3ygwxsiriqHjyGguRjWFx1u2m5jE4W4DJlmmmTuCUypdXwivYM8+?=
 =?us-ascii?Q?YzruC6uy6PoXRfpBl6lwDFh/f4BtaURW6pccT9I16VtuUNxKf5V4dcj+EPS7?=
 =?us-ascii?Q?J31FUukkntdJ4Hn52S90QLvRvKhFfejNiMw+mJFxBUWK9eLt3veN+1zNJOw3?=
 =?us-ascii?Q?KGr23Qz8IW1VHaC8XjW1XJRgrwvlmTv7gk51chLPt4Q8YfYmqhgpev/nqaAJ?=
 =?us-ascii?Q?A3UtJ4TI3+n5dfaS8k2DGsfo3sXKnQlRmdwLow1ir3EIgiMWZx0BW5xjM0X+?=
 =?us-ascii?Q?s1Qh7GBey+SNgZm/jjf+RIHZV+XxX0U3LDAr24UvDWplwZOggf2uReMf20pY?=
 =?us-ascii?Q?9NZ/B1DIhE0vaGR6dsySAAd5Cp5JECXwy4tUI9SgDI4U39tJ9D2KZ0yN/ZNl?=
 =?us-ascii?Q?uTMAhxHJjQLquacmkEgmph7JHZ8hMb2U+a1KM+gRm91wxQoUytPyE5/9ffHR?=
 =?us-ascii?Q?6YAuAKV/YLgRm4hnAOf5pBoiVeObrJMkv1kmNPuEjTHRgep0rHgyx4O8wWaZ?=
 =?us-ascii?Q?CDeF8WGMLKhQz47S+Pp1Jx3SuF0uwaPD+4sTEJ1Heoe9bHgW6iLVMUHp7sJH?=
 =?us-ascii?Q?GLLlVXVVWqdBMQVsm5U1/IowBvNvqxxyu4ZGHbDPmkkxLYu9+TritwO+JaZX?=
 =?us-ascii?Q?IbrgbKPIUZvC0JMZRCPm1sp+TZM3EFaX?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM8PR03MB6230.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?slOJnTynSRsHPdbI48Zr1J6QXXfs17EmPkXydsmZR5mnpChT+vve+MJaUq0f?=
 =?us-ascii?Q?FexuNjruS2HVmz/WPEk+XZAM26KRwHcCWfu/AZYG+6e5uqRKFLPv/u3ZExN9?=
 =?us-ascii?Q?FHXp2MBiCfLEruUI2e3ssFbk51vb4ksmNTPZ5AjCHTllM0MQ0l/6mbkdtkI/?=
 =?us-ascii?Q?200i980Az+Qd6F2cawKe5K2dkdrnZN1/ZkLOO6GJGrTp9dFtWPjfHb1VRdPR?=
 =?us-ascii?Q?72olChHYJRc0u9b8xCQtLxG76zvk6/q4pfsq3sh1twgw4C7QuMD6p8AKloiP?=
 =?us-ascii?Q?XhS+85cTRP6fidun5ofn2x20vN5SEAKG1V5aRHmQo1qnZHuASkO0EyiPNDIc?=
 =?us-ascii?Q?GeuNi1veZLggV9vm7TYXuHcqx/AH/frrhsw3FWoUlrOtvas4c/A/grjCn+N1?=
 =?us-ascii?Q?KRBtUFs1qwjJCT++PxQKkSqLMEKxGFKfs1XwG575+6A0DRbFfYYCq/f5Mdh9?=
 =?us-ascii?Q?uiqk2ATFPeioBNitFNmM4XqyUDtH12o7RygermuowquY1Fuia6OfM58V5VYR?=
 =?us-ascii?Q?dwuGgwFP5vYRMYIb9UZbOwGOEc5BinOw45woJBDh/IWzvSfuQxD6swuEkrDF?=
 =?us-ascii?Q?cVZhtVH4UPWQ9vlz2WCTz4OnBEAnP27N/i6nbsf2X6gJmzJp9PXTC8E0BMyF?=
 =?us-ascii?Q?VJaVWW1BURQt68iZie8fALKcLgx+zQvjifRazsnvppJ/MVGJOvjQtSE/HAD2?=
 =?us-ascii?Q?9XMWYkRxHYeoEyGd9NCN/0G/zhnUbdTrLPDUkvvjD6Aq1yHZEpfmA2aBwBZV?=
 =?us-ascii?Q?cQlFkh5Dcs7FiZBtpMkN9pJSxi4dcOrRrCmfABgjgEI20g5zKsuTMTqg8DVd?=
 =?us-ascii?Q?dsjRDYOkF9aRq/fGj21oR936lqF3NiVtPyKBvmz+r+jiWYQdht2J4eDLJIIo?=
 =?us-ascii?Q?xSvGOX/7OQInHdx+h5JvtRmL70q9LHHfzxwOr3gRx+3p0SP2xSYaDBxWAWmc?=
 =?us-ascii?Q?W+frU20YQ1/6SMebxVMIiMGye8359zy2wduwf6TBvTUE9GjsKohkspNmxUhb?=
 =?us-ascii?Q?VNySHj5WWLLBY50dPe14/H2IwRyk91L2jZB5qroY2vaAY1SNFONUahXjq5Ka?=
 =?us-ascii?Q?SdAjRywdZa23+i8iUtuhzE0GQA6tAeT8Mf7UjOrrXXpHKvmqXxBeSuiKekfH?=
 =?us-ascii?Q?ldB88zLd7eZeYzeqFp+t3er8rNkEx9q5C18h1psj4ZxHNv3xkvZwRO6GiD2A?=
 =?us-ascii?Q?+d7tId/MQ0mR+V7GeKEwrSSsA7azsgAAItNN3juZuJ1VoMPps/pTGr9cFSfe?=
 =?us-ascii?Q?GJKVCAOMW7HUiRZGm2LbyTg8/viInic02yq/WcYivtY9x6nJ/OgoXn4aEZI8?=
 =?us-ascii?Q?xUk3cz1kWcPIfylK2DBGcb2LeNhtVFVpzc4Palh0HITkG5WjXXCtJ3ASF6Lh?=
 =?us-ascii?Q?IBtVEUft/jLs7ZixWvZgc1naXqmJiK5i9CatDpb2JKY4oiIMc88DUIu7/fxH?=
 =?us-ascii?Q?mpuscHvNva03P4eT2BPBS8fs618uhWrf3DIsCEZqZhbupBLrhtit2cH6oLLG?=
 =?us-ascii?Q?RQvneQbbbn0vmWqDZKh3H4b1JovnUWQyG5HVyvexS9B4vJbeM4EI1D0lS8H+?=
 =?us-ascii?Q?hxVP8s72dq96fRwcxaTtbICE9dDcLulZ6lxPCecbqc3qCIKIg5ncnZN+oA9I?=
 =?us-ascii?Q?FQ=3D=3D?=
X-OriginatorOrg: altera.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a13d9f50-f807-47a2-83da-08de362958a6
X-MS-Exchange-CrossTenant-AuthSource: DM8PR03MB6230.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Dec 2025 07:13:54.7077
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fbd72e03-d4a5-4110-adce-614d51f2077a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 22XhEqljYrQ5e/D1maya9hC97pj1pdB2S9TPcwB3wxPiIzm6Tv4Euf7nOyiP1ucbwCrVNfWdnjryH/CtQQYFJQkKC7RrLK8SnNUStB4xt70=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR03MB7475
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251207_231400_626759_B1E35C42 
X-CRM114-Status: UNSURE (   7.27  )
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
Reviewed-by: Frank Li <Frank.Li@nxp.com>
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
