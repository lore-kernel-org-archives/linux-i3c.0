Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33795D4336A
	for <linux-i3c@archiver.kernel.org>; Fri, 12 Dec 2025 09:05:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bGJMJECaIh1mvGiQJpqNDFa2SIfi/r3b1Y+slwplwqA=; b=4GVFoe5c4lU5Jk
	7iCGGJJJZUx/8UrDG5cJus6F9SrOZer/XzoF/OkmEqUGylnPP+EIw9xnn3AMFovALLmPEw/GfTkW8
	Jl0y9aZAOxC438Oip1J92vz+tqDKyBhZ0cCzYCOMBmtWehUQJ9QWHFH4z0f77UTFZ/KaVq7KJ2p6F
	+kIyWtosAW9JqWj2TpFlNr/vVEyIkXraXJnGP/VA3h8rskeqYiXfyHgEy5AjE1/evn0SGmQLB6woE
	D54Xa5hxAIT0ehHtkfCpmbqIQ5zr8BDWc6J6Rgv2mzCGQWfLXR0r0BIGTaPoTfz2tE30lD7Fm6Ghb
	q4eizzlS8wUsMsuFzYGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTz5r-00000000IzA-3LTT;
	Fri, 12 Dec 2025 09:05:43 +0000
Received: from mail-westus3azon11010058.outbound.protection.outlook.com ([52.101.201.58] helo=PH7PR06CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTz5n-00000000Iw2-3mtW
	for linux-i3c@lists.infradead.org;
	Fri, 12 Dec 2025 09:05:42 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UpQaMNzMo7waip+ezM4+2ll12A7NeAsoGpyd9UPMQWpopyD2bs8++I3LvLMSrBZDYGTC1Ryu6bIO0sAKMCJm8Ug0P52oRQc7dXMnuuQjWgG1ahxsJdvo5bxGKN+UzwbCBzmuWXIP3AFDbv1P34eGJbJ90Tkt7QveFysha37GbVutTWXbsqCSHfr7LnzHlaCIafIzeBzWOAIHq29NDYIcfxV7R/rUDQsV+/2+/7uKKv4sqOlOKkNEMvfPq7iU3j2BDvMYI65ypnUQldl0/qKUWkas4RDi37V1suyJcbcneConeyvJvLtaOYUZikdeJjJFFmMy8BfVtLijHrAO8tvYQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=G5+LosO1l0OXbYOmmY82M6StrmtkXHbCxPzlTlmEyEM=;
 b=SoFY4SRj7Fi0A7xF4Y4WCMHbpyxEWcmpzviUJ7ni0ddIM+oGcMbeO0KncIBulsiw12spPPR8kMb3Kj3iyVtYsse+yQDbqH6BBQDPIo3KR6pE6O/DXh8FBHD1j8fut9xCxyDNpx5A/+2dt63dq+HMuIr/lPr1X0BMB2lVfekMI2TV/X2dZ0Q42fLoJriuPXWLQ8zfV7ufRacaWm+6BhH1waVU7qSaU/nY2wVYu8PE03riFmeDoOq7/j/UIZ4hkWMBczxX5FHbFKT/VIxR8eeYTvjkXJRGDkQoxzB+RkOd5Gt4uewgH0Gqu1rA+vcMgPAcj+6bQgXVUtrD/rd4ckCbEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=altera.com; dmarc=pass action=none header.from=altera.com;
 dkim=pass header.d=altera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=altera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=G5+LosO1l0OXbYOmmY82M6StrmtkXHbCxPzlTlmEyEM=;
 b=GbPYEE2BEcL/1ArLGRAOZDqRMRejMIRcEKQlaq6CY72/am2Gdd7tdEPNdPpu2KhxPFWUxadHhVbVYIk1dVVf+wO5y2sAONRI2LuRMX7PhOgmA0IP587yv4Cgj/dgG/2epNeXRHUzDkYYosFkdXrnShKvUwEYcYtrXAZKat9VHHjFvcKrxqiGLjl7ChZ33rcU9rDoMr3NeHJ8dahXwBk+Lwm4SYxzCZfbLKpUKbj3FRgEhW/GE2y/uR5uQEkpphPGiU2dhWcX+x6oJGQEt1yFQKKIGlU1NYHoj2BFsdhUGHKLvKj2Go6IAtrUQj6GuF+84nezqD9wVpbJfaKeHz/Uhg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=altera.com;
Received: from DM8PR03MB6230.namprd03.prod.outlook.com (2603:10b6:8:3c::13) by
 BN8PR03MB4916.namprd03.prod.outlook.com (2603:10b6:408:7a::18) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9412.11; Fri, 12 Dec 2025 09:05:34 +0000
Received: from DM8PR03MB6230.namprd03.prod.outlook.com
 ([fe80::abad:9d80:7a13:9542]) by DM8PR03MB6230.namprd03.prod.outlook.com
 ([fe80::abad:9d80:7a13:9542%3]) with mapi id 15.20.9388.013; Fri, 12 Dec 2025
 09:05:34 +0000
From: adrianhoyin.ng@altera.com
To: alexandre.belloni@bootlin.com,
	Frank.Li@nxp.com,
	linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: adrianhoyin.ng@altera.com
Subject: [PATCH v8 1/4] i3c: add sysfs entry and attribute for Device NACK Retry count
Date: Fri, 12 Dec 2025 17:02:55 +0800
Message-ID: <3c4b5082bde64024fc383c44bebeef89ad3c7ed3.1765529948.git.adrianhoyin.ng@altera.com>
X-Mailer: git-send-email 2.49.GIT
In-Reply-To: <cover.1765529948.git.adrianhoyin.ng@altera.com>
References: <cover.1765529948.git.adrianhoyin.ng@altera.com>
X-ClientProxiedBy: KU0P306CA0061.MYSP306.PROD.OUTLOOK.COM
 (2603:1096:d10:23::14) To DM8PR03MB6230.namprd03.prod.outlook.com
 (2603:10b6:8:3c::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM8PR03MB6230:EE_|BN8PR03MB4916:EE_
X-MS-Office365-Filtering-Correlation-Id: e99ce9fa-f7b9-45e5-b647-08de395d9b81
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?EqhrFYMsW+KDqM5g1PYdHaqRohwCIvL8OkVky8tpNj5i1lEf54RSDpEnQnen?=
 =?us-ascii?Q?s5rDDpVXE9ifYQIqqr77eJvoYU0xxFzZvb4Nn1F+lx1dNkI9IF2nUNqEoVQW?=
 =?us-ascii?Q?eyIYTK3BkKvL0uPvhDbANbpdaQ34hbdbtWBQxgvv1BiQCynN+iMVlvur3mNX?=
 =?us-ascii?Q?x4ZxSjw5SrYrs9qxQZTFq6oSFDABUqTvrBQTN+H/GkZiotpbPL1D9m51Kxmb?=
 =?us-ascii?Q?IP/0dJsEQY/Z0JPjyEATBHIv5bJ/LY8GusOXmPE0s47csz/k9YGCf7412jMm?=
 =?us-ascii?Q?x7z3/hdMrNlBivUyBJfr1fYwEeoRrXIErUd/gIAx8L3N/4FkDHp8iz95kpp/?=
 =?us-ascii?Q?jyb1qjRv6IeJPPDVUgfB9kNiIJS/1pC9lyx2PdsWwPXEagEIGEMgLIHYTKeb?=
 =?us-ascii?Q?aK5ejRG2JiGfqksE05q2GakQyTh3vTPu8SbeXrbslat9T0LLv01KO5O+zI9k?=
 =?us-ascii?Q?4gPgNPR08WDqUvCLOcde80J/AtyCweJH9vMRL6NL70lgcOsGGn8FCr0IPIBH?=
 =?us-ascii?Q?xevMV3vOi3otN73/f5XKnzfqVnqGRa5a59w3ChH8zWgELp64Vayxbs/rcSNF?=
 =?us-ascii?Q?BckuskUAlErwwbDdP/tW1XT920ctNOK39nrJweyag7wrVi7qmVHp0c0vRTwb?=
 =?us-ascii?Q?EGvOnf4tpsMmtcKbd6e0a/5ldLmUwurzjBUhVJcQqdpoM1qa+6NxaLzQi7YT?=
 =?us-ascii?Q?gzqGzNVykF3dNqh9mxDjVbFakNOkEQ5JRs7kQJMktSZ67VjxCUVev2adVWzj?=
 =?us-ascii?Q?PZ1uFWPQRxr0fhNdJ8biTZEezQ+bOTyHaAuJs5RI/nXOfVBE5bAGAstnqPvy?=
 =?us-ascii?Q?bID4cvhpHP96mTeWIjXsf2kDbbt/40RpYH+TzdYxw+Sb2V56R7n0ZS1EabIA?=
 =?us-ascii?Q?4yqJA0C0kwpPCp4KFHB3/gP0L+YaxQOAvAK/a8zlZlogYYk8NuhOgpeHi/78?=
 =?us-ascii?Q?DxG2jmE2lLGRx89O+lAtF5s4VQ3Gq+En3vYxwHcBL17++KiCqFoLkj+bAv98?=
 =?us-ascii?Q?e5TgtmC2lR9t44rPsSQHtklplY7nSzv2BzPACQEctIL2lzrkq/rFqTsn8UZf?=
 =?us-ascii?Q?Zdr9fNJ3aCE/6rjgvP4PFgeoW71uOY1ehFRbMS44g7PxvmEypbGpN1HksDls?=
 =?us-ascii?Q?+6pAURcFX5yKDLjBrsONwXDePwr/ZGyUrerTpVb/7vidW1fheKSxz9IY5UuU?=
 =?us-ascii?Q?kcqIDhlbkpvD0iRgFFcBbQHGyrQzeg4q/RYdkQlhcG+H0shMfGEbsRIuBOfV?=
 =?us-ascii?Q?BUo7DTY8WTI32Fq+AJlZBZsiwV9jfGqpHujwPGr1BQc3DTb7zKlhvrkpEgTB?=
 =?us-ascii?Q?6QQVARFmi5mpCLsd3QDdCdaCUIIuB4qQrTiqwZsB6uayaxg/JR1GzUbgcc2m?=
 =?us-ascii?Q?7C4QHCBB7WFvaY9vZ/JnejP7LtDn4ICGsmq5RxnSVRiyf769bot/4xuZCVhu?=
 =?us-ascii?Q?HqaKdbeBjkoMQXnmsTwi/6cWmuNEdBJC?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM8PR03MB6230.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?OtHL5t0mV5LC5GQVIKQckzyeVHqs+f6+YDkFCQbi5uZK7v3KJNeCkAO7NBHm?=
 =?us-ascii?Q?3RNg+aINeekPxPemU3M3kNET4qujw/u+S/XhqQGFAq3mHtLa1uWFW4Sj3A6/?=
 =?us-ascii?Q?7D4e91QCw80W7HQzZ1Zz1RhjJNTGttv/Muc64DWRy6Jqe7UR1u88JKw/aaQz?=
 =?us-ascii?Q?ezTICzHl43XFHoYb6C/u6xukcVZyu0jkMpjer93i9ednU8frSVxFdlcXiZno?=
 =?us-ascii?Q?n8aihFiAB0wF30BivizM8iQasiqvlOg1HJkUBsysg3bMOZ/7VEjrYZ3yOPsS?=
 =?us-ascii?Q?BMQWpC/sXOU0V+RCd+lJaiH0KuBA6ByCmtIS9KPDYCppGBJBR+vT5dSjLQhK?=
 =?us-ascii?Q?l9cv7cIv1bK1MaA6GRJ4ZYoF1cXwqVn8tEd6WK4bu9m3MaA8fDKVENqSGuWs?=
 =?us-ascii?Q?R5YJN32C8Eg3XDAw9Lc040pERmv9+vTgDiGDnnxdQcBCx2xSE+aT9u/cYTDI?=
 =?us-ascii?Q?s+1X+4tv+nk/4BQFE/imSslcijP7ZabquCoVlRt7xOF//Q6o9mVqk2aK50zS?=
 =?us-ascii?Q?0YLNgjt+8PX3v6LKGUkg2Yc3Ub+4UjcCMsNhuGinwXZGnPVlijphC6fd0tqE?=
 =?us-ascii?Q?qR1oAgX+VzuWCJ7u/7S66XbpDTU2iti6Xqgib3Q75xlTwe/bjn8KsEA1N1Fz?=
 =?us-ascii?Q?gsxRIo8EbbvujHLhG2VelRC22ykQFEtQNDDJ/06ooJ715ERIJ3sQPKvcx6kS?=
 =?us-ascii?Q?eJ6MV6B81v4qEIZVjAzeball5dKzMsU9TDLLiGu1VONvUEeuuf3AvSJUc4Ss?=
 =?us-ascii?Q?tF+NnEABCmG0uVcfwMQhqFIJt4rEda1A+EOhD01cGKqaTFaGw9M2dRUZE+Sf?=
 =?us-ascii?Q?pSpoQX+IEv/kkKAMcf5a8WPK4wXXXwhrJViiFSpbQRIeTKi46Uu6AAXkX4+q?=
 =?us-ascii?Q?DbCLLu4/uoDehv2AuLVcirWzo54Q5cgOp7HKCw6uMJRu3eIAXl/l+JN8XgFg?=
 =?us-ascii?Q?+0RnOuE6KIdagVC1cJTZ9qP/7kfu+1IacFBesbgVnIeFn/C5zwLtR95Dkn2/?=
 =?us-ascii?Q?vRiEiqB7PyK86ZBRhhKw36KVzmk+UlVXCA9fKJXCu+9CmvlGkV8ugatdpbqr?=
 =?us-ascii?Q?QGP+IkqR9MDD2wy/V8U7NAGj9UJ0q9xxYCUYp3MyFXqNgQcAXA/XHFkVsL4Y?=
 =?us-ascii?Q?zwCOi/5icKm+JHLccVHKgvYvLIXqKZYNa+n5maMdv1iY6ZABTgZiQ6q/oLUE?=
 =?us-ascii?Q?ESA4cpW3El0VgSK4jmeD+6dEP5H8nhzTdnjk02UlrYMg6Kazybg4xn1xREJD?=
 =?us-ascii?Q?z+dSh/7qOKUd79kgMWS0s9UhA8iQtglmO6o6u+6s6O7zY+uLHKsqEq9dqGFT?=
 =?us-ascii?Q?4rq+uD6agx/w9y4W78OtmksIxtEH4MkEqPDkCrZbzpZ27XQayLtsLrFXCelx?=
 =?us-ascii?Q?bRJqkrPpNA+CmGgwXwxVmIKG4cGS6TvWAkgKU66DiMzNpeihOLI+CXWlTL11?=
 =?us-ascii?Q?udKLbSVjQaLCCTsOVEhAPMg6iWMslnZ1fhQkh761KEuo8mwjskTvW2kratvX?=
 =?us-ascii?Q?ykrsMz3yFwz9oPpM36K3tC+lJieT9gg/w8HA9NgsM36R07yzdFNquwjP6SzJ?=
 =?us-ascii?Q?ZkdN2w1NovvAbqcnffUEIPQ4PaiE8Hc2bfLCUr0HuqqnEijDeA2ih+VvMMeK?=
 =?us-ascii?Q?xw=3D=3D?=
X-OriginatorOrg: altera.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e99ce9fa-f7b9-45e5-b647-08de395d9b81
X-MS-Exchange-CrossTenant-AuthSource: DM8PR03MB6230.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Dec 2025 09:05:33.9922
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fbd72e03-d4a5-4110-adce-614d51f2077a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NW2nKqfobAzkGstu0BAKtKHqmW9m9UXAdZPVrcGlYJPrUXcbqaD5PLFRz6fDLT6iq9b93tcG+UMHQIXI7h1nakPy5L9WvVoEakUJpZyGwRU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR03MB4916
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251212_010539_974430_0C6758DA 
X-CRM114-Status: GOOD (  14.09  )
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

Add a `dev_nack_retry_count` sysfs attribute to allow reading and updating
the device NACK retry count. A new `dev_nack_retry_count` field and an
optional `set_dev_nack_retry()` callback are added to
i3c_master_controller. The attribute is created only when the callback is
implemented.

Updates are applied under the I3C bus maintenance lock to ensure safe
hardware reconfiguration.

Signed-off-by: Adrian Ng Ho Yin <adrianhoyin.ng@altera.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
---
 Documentation/ABI/testing/sysfs-bus-i3c | 11 +++++++
 drivers/i3c/master.c                    | 39 +++++++++++++++++++++++++
 include/linux/i3c/master.h              |  6 ++++
 3 files changed, 56 insertions(+)

diff --git a/Documentation/ABI/testing/sysfs-bus-i3c b/Documentation/ABI/testing/sysfs-bus-i3c
index c812ab180ff4..c1e048957a01 100644
--- a/Documentation/ABI/testing/sysfs-bus-i3c
+++ b/Documentation/ABI/testing/sysfs-bus-i3c
@@ -161,3 +161,14 @@ Contact:	linux-i3c@vger.kernel.org
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
+		the automatic retries. Exist only when I3C constroller supports
+		this retry on nack feature.
+
diff --git a/drivers/i3c/master.c b/drivers/i3c/master.c
index d946db75df70..87f0c7b5df80 100644
--- a/drivers/i3c/master.c
+++ b/drivers/i3c/master.c
@@ -685,6 +685,39 @@ static ssize_t hotjoin_show(struct device *dev, struct device_attribute *da, cha
 
 static DEVICE_ATTR_RW(hotjoin);
 
+static ssize_t dev_nack_retry_count_show(struct device *dev,
+					 struct device_attribute *attr, char *buf)
+{
+	return sysfs_emit(buf, "%u\n", dev_to_i3cmaster(dev)->dev_nack_retry_count);
+}
+
+static ssize_t dev_nack_retry_count_store(struct device *dev,
+					  struct device_attribute *attr,
+					  const char *buf, size_t count)
+{
+	struct i3c_bus *i3cbus = dev_to_i3cbus(dev);
+	struct i3c_master_controller *master = dev_to_i3cmaster(dev);
+	unsigned long val;
+	int ret;
+
+	ret = kstrtoul(buf, 0, &val);
+	if (ret)
+		return ret;
+
+	i3c_bus_maintenance_lock(i3cbus);
+	ret = master->ops->set_dev_nack_retry(master, val);
+	i3c_bus_maintenance_unlock(i3cbus);
+
+	if (ret)
+		return ret;
+
+	master->dev_nack_retry_count = val;
+
+	return count;
+}
+
+static DEVICE_ATTR_RW(dev_nack_retry_count);
+
 static struct attribute *i3c_masterdev_attrs[] = {
 	&dev_attr_mode.attr,
 	&dev_attr_current_master.attr,
@@ -2962,6 +2995,9 @@ int i3c_master_register(struct i3c_master_controller *master,
 	i3c_master_register_new_i3c_devs(master);
 	i3c_bus_normaluse_unlock(&master->bus);
 
+	if (master->ops->set_dev_nack_retry)
+		device_create_file(&master->dev, &dev_attr_dev_nack_retry_count);
+
 	return 0;
 
 err_del_dev:
@@ -2987,6 +3023,9 @@ void i3c_master_unregister(struct i3c_master_controller *master)
 {
 	i3c_bus_notify(&master->bus, I3C_NOTIFY_BUS_REMOVE);
 
+	if (master->ops->set_dev_nack_retry)
+		device_remove_file(&master->dev, &dev_attr_dev_nack_retry_count);
+
 	i3c_master_i2c_adapter_cleanup(master);
 	i3c_master_unregister_i3c_devs(master);
 	i3c_master_bus_cleanup(master);
diff --git a/include/linux/i3c/master.h b/include/linux/i3c/master.h
index c52a82dd79a6..b0fe3c266746 100644
--- a/include/linux/i3c/master.h
+++ b/include/linux/i3c/master.h
@@ -462,6 +462,8 @@ struct i3c_bus {
  * @enable_hotjoin: enable hot join event detect.
  * @disable_hotjoin: disable hot join event detect.
  * @set_speed: adjust I3C open drain mode timing.
+ * @set_dev_nack_retry: configure device NACK retry count for the master
+ *                      controller.
  */
 struct i3c_master_controller_ops {
 	int (*bus_init)(struct i3c_master_controller *master);
@@ -491,6 +493,8 @@ struct i3c_master_controller_ops {
 	int (*enable_hotjoin)(struct i3c_master_controller *master);
 	int (*disable_hotjoin)(struct i3c_master_controller *master);
 	int (*set_speed)(struct i3c_master_controller *master, enum i3c_open_drain_speed speed);
+	int (*set_dev_nack_retry)(struct i3c_master_controller *master,
+				  unsigned long dev_nack_retry_cnt);
 };
 
 /**
@@ -514,6 +518,7 @@ struct i3c_master_controller_ops {
  *	in a thread context. Typical examples are Hot Join processing which
  *	requires taking the bus lock in maintenance, which in turn, can only
  *	be done from a sleep-able context
+ * @dev_nack_retry_count: retry count when slave device nack
  *
  * A &struct i3c_master_controller has to be registered to the I3C subsystem
  * through i3c_master_register(). None of &struct i3c_master_controller fields
@@ -534,6 +539,7 @@ struct i3c_master_controller {
 	} boardinfo;
 	struct i3c_bus bus;
 	struct workqueue_struct *wq;
+	unsigned int dev_nack_retry_count;
 };
 
 /**
-- 
2.49.GIT


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
