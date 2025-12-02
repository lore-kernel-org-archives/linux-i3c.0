Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 098F9D116F6
	for <linux-i3c@archiver.kernel.org>; Tue,  2 Dec 2025 08:29:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8eG2kAB1g05PZOL1oRbG8U6jbgH8k5k42XY4k93Xa7s=; b=sOgcsSg3+E7rd9
	UXrSSwFgNg6k/rvNa7bx4II1ddiLlizTf8R14XeCDDqrFdKUB3qBIUpfmk4WvvfXej87camixq8sT
	qK1vhExF08qkWj4Jl5ZCwtecLo6VDlgu33cydiCpnUBT7o4V0+ofs3qZyM4Z+rkoABQG4a9sICTje
	utAz0BY0aEIGntFbAMrHt17+c8lNici9+fk4lkpMZrZFWzECThPJN9Ik3e68I9gzWwMg9KjqXBP/f
	XwrHDnBlVbs1MFe+yE3n3uvQM+PXVnXoSC2qSkYXjXfatxH26E0oNmZoKQHG8O+RKI6A2fBue7Kfy
	vb8SHi0gJHiB4oElW4AA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQLkq-0000000536Z-3JYH;
	Tue, 02 Dec 2025 08:29:00 +0000
Received: from mail-northcentralusazlp170100001.outbound.protection.outlook.com ([2a01:111:f403:c105::1] helo=CH1PR05CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQLko-0000000534c-2FcU
	for linux-i3c@lists.infradead.org;
	Tue, 02 Dec 2025 08:28:59 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FjZ8NB/s2JhSstYqeOMWgUUBArylRaMSkjQ7msxTsmB1qiv88NbJGDkAc4Ai6u2MlZIZcIVHQ20wCFx43ME86tOsfsQmCbqy3GklJL6uCHmfGYcYxZcle06PK/i4TsMpAA+tp3HaXzQa3n1Yo188clTSkouW5ITAyCH69WDV2coK14vFZYgnUBNWuTiy/x5xKi4yza/N6z3dVPdYAIVuVmWozUn1eDyCkHezVtiIKSDwFbGs9o1aekq6loqIrSefyN+RUBI2zibY5gY1+1mbYjw2MgilshJY5/mSwdXHYIu/bJ3OimJEjsZJFy2A3WZBtN4m6HAYHuj5SAe61TESZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xaEm0zOzBn21jy0g8I48vBFSxKXMaKvwGSbcmsiaP+4=;
 b=OBpH5ewIswFLXx3ttjRlwEJmdnmF49eVD56llhlJeOzwmHOF1QIrBLEkhD9IF4VDKMOghsd1PMSgHpbb+nfjEnGk+DjJhUiPDXCsYXDpyYOGsEH8mpuMp5hpLF0ePszyz6OLLtzMHPLZtBSpwc89HOi+T9r6olE7I+bQfYm5VVwqkGVNqf6O+HNp8dUOAoGC2bVXSuaH6qLRNMxlk2N4CBDBe7oBEXIZlLCGgXbXHghLVLx2bdkJDWd47GvcL9FS6wEaUKPT0HZUOLVw6ZuphYwNfpX2Yp0JdWQNTp0W56Vfgz/DHETMr9Q1lw+iTPtBdc2i5xmINaXiGi35uW7Ltg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=altera.com; dmarc=pass action=none header.from=altera.com;
 dkim=pass header.d=altera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=altera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xaEm0zOzBn21jy0g8I48vBFSxKXMaKvwGSbcmsiaP+4=;
 b=eai4vjsFMp/lpEcZ6aICqo2Pr6DEZqYwfyJCSNs6TuidOgQSUhtdM3ppCaBU0u7kFcJyppNbnN+zHpi9b2Ul60LlVKKyic5oGHtezIOEvwUYmQQwnvymTpplQMENZJ0pJQzk0rdrDTCO1MPaD6r8OjN7vt+Mr6Yqaplpo/z+Eo9GgT7BPXh4UmavKhdhNHkI03y4pW7iZxQI0z0LjgfRRYZmkDay4+ZWHefYGT+a8xR2rPohQ47T4LzdlNaAYX+kbLEtj5l8qf227SDI8Vqh6rwOajB094x66yEyCYzK0SeKD6BDu8cHhCMIio8QFQz7LNRAZd6S0jGjGs0KpE4pTA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=altera.com;
Received: from DM8PR03MB6230.namprd03.prod.outlook.com (2603:10b6:8:3c::13) by
 MW4PR03MB6459.namprd03.prod.outlook.com (2603:10b6:303:122::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Tue, 2 Dec
 2025 08:28:43 +0000
Received: from DM8PR03MB6230.namprd03.prod.outlook.com
 ([fe80::abad:9d80:7a13:9542]) by DM8PR03MB6230.namprd03.prod.outlook.com
 ([fe80::abad:9d80:7a13:9542%3]) with mapi id 15.20.9366.012; Tue, 2 Dec 2025
 08:28:43 +0000
From: adrianhoyin.ng@altera.com
To: alexandre.belloni@bootlin.com,
	Frank.Li@nxp.com,
	linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: adrianhoyin.ng@altera.com
Subject: [PATCH v5 1/5] i3c: add sysfs entry for Device NACK Retry count
Date: Tue,  2 Dec 2025 16:26:09 +0800
Message-ID: <35bb0a3cae4664dc423ef57a1ef3ebcb378bce00.1764663888.git.adrianhoyin.ng@altera.com>
X-Mailer: git-send-email 2.49.GIT
In-Reply-To: <cover.1764663888.git.adrianhoyin.ng@altera.com>
References: <cover.1764663888.git.adrianhoyin.ng@altera.com>
X-ClientProxiedBy: KL1PR0401CA0012.apcprd04.prod.outlook.com
 (2603:1096:820:f::17) To DM8PR03MB6230.namprd03.prod.outlook.com
 (2603:10b6:8:3c::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM8PR03MB6230:EE_|MW4PR03MB6459:EE_
X-MS-Office365-Filtering-Correlation-Id: 0fd421da-929b-4f72-7a33-08de317cce01
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?QkwDngbCRw6GSvzqrziXG17F9kw5rQD6zE2DufQrQUHLNrrwdXbRFA9zQRrb?=
 =?us-ascii?Q?azbA+p234Yux1yhBSeNwqg3Ttu0zPGjvOPpjOFExqioL+qjx1aVKx5GwTVqP?=
 =?us-ascii?Q?URN5VZzq4Fdkjm/sHjWRDHRe14UoWDL3iPHdWCd9WcCJROsE89V6a2KVFMd/?=
 =?us-ascii?Q?839XHrk8Fy6x84iI55oChGu76wWBflsA1Z70Vvq70Pq6ZyRI4ZluXcFDrWcb?=
 =?us-ascii?Q?IZqfG2uqB2vKOsVkcz697FEhn/kVJJjaUxC+1ce0cOK52rhtTjfQwuWOSquY?=
 =?us-ascii?Q?yGqnlUdvE4rGtqkj8JsV5dazYlKGPr6a4IjUQ60O2NfwnCZniKCoPW2HMyDd?=
 =?us-ascii?Q?eYqrqUUHD5AJC4w76qetvaRjnuwzFCG7jusO8RL3nH8eihRYKOecbHfhzU1U?=
 =?us-ascii?Q?/6aE6auLHUiMQDAxpA8zYZKjvoftUKx/GpePLE66AF13dN4Tjob4qznMs5z1?=
 =?us-ascii?Q?9MqtTexDTWJ5JFEKhOXUd3wwVxs53aDU8cGjJL55wfGdEsiNACbBjsO4vp6q?=
 =?us-ascii?Q?s5EQIyrVAOm9FrnGaAHUw6VM+MwObyGna8bG0dLRgo9eQX5RCwwUNiDB1k7q?=
 =?us-ascii?Q?dqi8nOFbfWX2NwP4pLRbyELDMNUmLgVtgkLfrwgeURhaUV0HGkngFC3zGjF3?=
 =?us-ascii?Q?cQxGXtdmCvVcyTDcdfAkvja/wL3IdYFKk2vj6TXJFq5HTnQzaLTOiwinylXd?=
 =?us-ascii?Q?wy7+OdRnWiVFuSIPps/zoqcZzgNQcSWaPz4ljU8kP+L0ALYh5RTNK3TO0xWs?=
 =?us-ascii?Q?YZLL+Duzh+UIMiJ8mN9X6Lt4iwFOXfSdZqdApkCD1xrJg+YTS7F29XQq4CB+?=
 =?us-ascii?Q?hJY41Kn2NsIq2GnoosUaEY0REY3EJmZYd8M0xZF9J5QXcgjjB4gYs8I9W2GC?=
 =?us-ascii?Q?82qFZ0aaYv/VTi1kns159wztHnoNmypYPYOQ8K27P/7+aGrDQ10tb/oVGJTE?=
 =?us-ascii?Q?QWD3EUMEZiuHovGb4nY9k55VNmWM4htGLKWTkxuEUlgM4hW7BZCYl5jn103s?=
 =?us-ascii?Q?HdD1dp3Q6dlLdKWabmxh2I7Bjq8/V5qDSkXu3fzT9US/m3lfHopmMaKLBO76?=
 =?us-ascii?Q?KM4Fhq8/UvzsvF1FIuai3D4MyfC6HfwxnY8a5dSYpBCJrF/xFXJ5saJFIW+n?=
 =?us-ascii?Q?ADCGZovBe7dayKqF68w2r3lb8bMzWQd4Y7W7AeWQa9EeWI9HOAwjL6yaVho/?=
 =?us-ascii?Q?7pHyRONJAyB7rPSVh6pWm6qzkqT8ht7Aau1dgIUTbO3klvJtBNHnzVMibzjp?=
 =?us-ascii?Q?Y08eT+RyUPz73Gda3kmMj25+f+QBaN4rS4O4lUDCI9SD8u8hSOYwrOHtO8Xa?=
 =?us-ascii?Q?fBCZs6BuLfDZ+ZQQPloh29HAacSI42XsZEa4VgaFSWZuzzbINae+LLjlf6rc?=
 =?us-ascii?Q?V8NTbqc0JwxGUAJHBLHl9nWKXoMYg75rMHdPf0W+rg9ww2jeU/3ePqdelAb8?=
 =?us-ascii?Q?/Db153O66mpFfRmGSIlcOyv25+UMYAu6?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM8PR03MB6230.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?RjqrQHhKcjbLBNiLIJICX2rjNGkF3D8Br85e3ItUDBxNH2keM+txqf4AuZB2?=
 =?us-ascii?Q?j2pT4Bmu//82gXsQE+95a+vm33lKmjJOpeKBGUSjlldWYNzecrahgc1yT0ED?=
 =?us-ascii?Q?gen9AwFNemC2x6Rg3JAoj/OCr5SVifGLeQo56mDjUP9CDmkpGjDqlKSDHgRc?=
 =?us-ascii?Q?UWz/lj68PVnIr6toR0Cy2+V9kaHTNihfR/iIyb7XWUfsfJRTtvuzd4/ZtM87?=
 =?us-ascii?Q?Q5Yjdsa4DSb+bKi4zGxZeYUFVJw0mOcSYPoGmSXUvaReCO4jzfhX7G7GuwFM?=
 =?us-ascii?Q?7jakJx6NB10cfbjqT5VFusUmlnHas6YUu6j3529oHRueC9C3TPKxf4lt2qxE?=
 =?us-ascii?Q?0onpz9QGgYX4mTUD3BA3kiGoKclyl6XgMslhlEIseAq7SI54oYU44z2PPhKu?=
 =?us-ascii?Q?tASjc5JxMzRqYtWsH51bRUdDG1jXmrgI55lfQTRZ30aQJqJVerkCMNuzfwgs?=
 =?us-ascii?Q?xx7AoH+vWLX/weBSykal7puosWiF141PH3XnpMWERR3ldsIQFcHHpEnSHeKC?=
 =?us-ascii?Q?dVfuTgZB4sq1DwA0g/ExakFNRQ0sBMYuGIAXskAMekD4OhrahSxcHUI0ORRH?=
 =?us-ascii?Q?5pnqjsDigPvUBkHQmB6Y+gdWZX5aPX4k9rb+g8OtJ4xe/O5yWF/qCirbWytd?=
 =?us-ascii?Q?o9YDS9dL/JhbaTWoTM25rI6UputXn7HJ+rG2ymuHNBWm+CbSMz5SGDzYS0oR?=
 =?us-ascii?Q?LoFEzV3HuLu5N4G7KoNywy44/+471dytj10BmiQoZl+5HGMhzNUOCwYrLimn?=
 =?us-ascii?Q?9I1mtSQcRCXWpspVO+/7LdL6WhbuuOUqCrShN3vvbVo0fwVBFbE7E6OchpD7?=
 =?us-ascii?Q?JzVF4m7ddBPyUm4k1Kg36wzDiY3Nl28gCsL61a9giZoDfLxYfyIqjv1ktUNo?=
 =?us-ascii?Q?MiytcPakyqUx/By//pIICaHI1mrfdwdGQC+ehbx0W91KVzTKqnSAbOJxas5u?=
 =?us-ascii?Q?UJBai8X3zgXwrFJ2isvcjUEjqWPN0R1W9DfoVF0i3ElH/1fTq3qe1ge61F7Q?=
 =?us-ascii?Q?5lQMs3abA6Vk7FtH/PuV97/5HQU6kKHG2+dxCAoz12UQNqpYSueKmxwJ/y7H?=
 =?us-ascii?Q?hboIx1OQQmsosHbSkPKYONwCF5yXTkWzvMo5MbuoEYTm2ZKifX/ZRir2JpF0?=
 =?us-ascii?Q?pd+9eARYbpd7Ef2PjItEmMLa+4ktukaC7xBah7txX/kexiLkIxzmIfZTR1QF?=
 =?us-ascii?Q?g6YykKzSY0CpGnLXXaewBIIvOzW51d8JNz490Z+Na4GQvqMIn6CTM/3hfgLS?=
 =?us-ascii?Q?iMA6t6wx/XA596UyNaE014r3m6NHFIDk4AvMvPpIzTCJ/L4uRIocZltFfgex?=
 =?us-ascii?Q?DWK4WB5kf6mBU3zyCw3/Ec4FTN5BdE+iFIpGCBX4iklxlKrhiUb4cpVWuSvp?=
 =?us-ascii?Q?A5+u23aP7zKtdx/WG8tKB/jP4G+yGPeWtvqVZKPywpYzQ3yjTIx/zuvb6l7w?=
 =?us-ascii?Q?Lovp8jdFxyxiZecjlO8S9BSxqRUIsrqTKrLOZg6aGV1VUZTIYzlb6ef5NXpP?=
 =?us-ascii?Q?qHK3ITdvfGholq1oZtMtEU2btpXR1sBU4Ni3VtQKYYTLAYYuUYiaFe7sgaOS?=
 =?us-ascii?Q?Y5Ru/Sj40XGNjUogUHrrzmC1zC7aDNG07eIDA1o7aHcPQCEU3i4skCq81eFl?=
 =?us-ascii?Q?2A=3D=3D?=
X-OriginatorOrg: altera.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0fd421da-929b-4f72-7a33-08de317cce01
X-MS-Exchange-CrossTenant-AuthSource: DM8PR03MB6230.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Dec 2025 08:28:43.8512
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fbd72e03-d4a5-4110-adce-614d51f2077a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qRA156U1GSlT9kzE/RnIqaD3+BmVqG05MWwqZYLbX3Ki30GtjAviWPid482QgtV4azYW+FmY3/RcCCYAGu0Uo3O1Chzrih0diRaPCfWjgZA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR03MB6459
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251202_002858_574220_5439258D 
X-CRM114-Status: UNSURE (   7.71  )
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
