Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F914D111A8
	for <linux-i3c@archiver.kernel.org>; Mon,  1 Dec 2025 06:44:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=09K01jPxZEeuP8zopuOD7E6PvW3EN/acWhOYRwukAHE=; b=CDtYkm99Qhl/qT
	DP0gnjJuKw6Pk/dIhfrrh0inipm9mMx+jq64gJIGchi19eW1jpkD7eS/s8RUVAwZem8JkK1G2uIsw
	Vbg3M9xH+y3dE9uiJ8cfxrg++k6A3nbsCiVELnQFMFGwpjNWdSQbuO8eNXYHJ6D0aF1XvDhkiZJ1R
	YP6uwKPAYq+TZ+vb9c0TQf4oj3WDusZBpVNh+PRe86DYP/DhuHm40FuGpV9cw963ryNzvAF4nJrsd
	GmgMTPViEXbtIh/fKPwKAs7FPTj1UNfLbdXYM9uSyNTFCpUbmXaNXxdW2kn7TOhHixFcP0j/BFMqH
	vz2L7OE/9z518w2XwDkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vPxeM-000000030jc-3cKw;
	Mon, 01 Dec 2025 06:44:42 +0000
Received: from mail-eastus2azon11010056.outbound.protection.outlook.com ([52.101.56.56] helo=BN1PR04CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vPxeK-000000030gH-34zp
	for linux-i3c@lists.infradead.org;
	Mon, 01 Dec 2025 06:44:41 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TG05uREffAh8o0jmhaknM9x+H+GLELzekduYdGYzHXT6rroc7r/zGmMZ4p+mUW4d+wLtWqqSgDHK7qiXVvgkqcirVLe3Cy8I+gRt3b2GX6MIDyIQRu5HXUqvCRIejQoOC9YsgWPOWetIVI+aAnDR4Xnanh5QEN2PWyEfND7kj8mHkxABC4kU3S4SYeo7qs5gQdZSulH7Crx7bIGWBPUqd9fpL2769ZOa0xLUyC8rZkyju9mFF0zuYcHjhZv7aLIWQ+RlJswToN/LbRULy++eCJhIaUJok0qkzgSNa9r0kUZHlQJqI4VFU15LL+GlIKPoc3Byrif6gfrnUkhahJ0eIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fOrCavKV1sPAtRFeWuqX/AuOtZwXNHeSre3He5Z2z9I=;
 b=ee9ox7FvV3Mxx0vcc9+Kl7q/HjiPoy7m2d8WpZdWtU+fdzjGZNvPjPfTYfaLeEKk0rdgcI7EQqXamy73yBe6REwlY1GlYcAtBy8CEZDVzeVbG7GJ/Gs6G0gpuz8pc1CbX5BCNNKKnGHwbw51O73HrWFruIW49efTI5+/smHJWhdYV+CPxoR/IHvyboL62e2kbqctVoIdN08IXrJbYDD2vSQUecX5J7eFSQBJhGw9r6ZZIdOg2JEb7mK83WoDRqkvd4gV3sfi4Ka9HXM48mjscUCDr8Rap5M9MR7G62cDSfkpBFwIKRjJXebXdf6qLthhW5inyKmFZpPMFH+3QOd/Fw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=altera.com; dmarc=pass action=none header.from=altera.com;
 dkim=pass header.d=altera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=altera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fOrCavKV1sPAtRFeWuqX/AuOtZwXNHeSre3He5Z2z9I=;
 b=mOyNsr55jiKrBHsNYKr/8KHRkJ+Go8+GeXWEpAHD+Ac43w86bJuHvFWgDcZ0CVudFPCn8qBi20LG1e+eZZpzx9g5jW9gX1pirMXXYerd4Z/NK/QVtel2BAl7OzZeHHI/DvGrDCD2Ty7dM0muRqqmu1NqEBmhHFTzBMoC5YiOvn1agagqnQkfxmCw3DDOGvR5FM4RWi5rduooLdiivJLVwJhu6Fy346PSGF4iZKhEzERHn5MtqUt3vMUEJgciXZd7z5BS/7tincvUhGeQq2pbGbGpEtUq4wbL96NsaLeTBJVbXnEcwfyGMLOGawqwJZE6j9n24jiTmbsJM/6cE6TpXg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=altera.com;
Received: from DM8PR03MB6230.namprd03.prod.outlook.com (2603:10b6:8:3c::13) by
 PH0PR03MB5847.namprd03.prod.outlook.com (2603:10b6:510:35::10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9366.17; Mon, 1 Dec 2025 06:44:36 +0000
Received: from DM8PR03MB6230.namprd03.prod.outlook.com
 ([fe80::abad:9d80:7a13:9542]) by DM8PR03MB6230.namprd03.prod.outlook.com
 ([fe80::abad:9d80:7a13:9542%3]) with mapi id 15.20.9366.012; Mon, 1 Dec 2025
 06:44:36 +0000
From: adrianhoyin.ng@altera.com
To: alexandre.belloni@bootlin.com,
	Frank.Li@nxp.com,
	linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: adrianhoyin.ng@altera.com
Subject: [PATCH v4 3/5] i3c: dw: Add sysfs support for Device NACK Retry count
Date: Mon,  1 Dec 2025 14:41:56 +0800
Message-ID: <42f1d2d980d45de27b0bb3bff85253464dc387ba.1764571045.git.adrianhoyin.ng@altera.com>
X-Mailer: git-send-email 2.49.GIT
In-Reply-To: <cover.1764571045.git.adrianhoyin.ng@altera.com>
References: <cover.1764571045.git.adrianhoyin.ng@altera.com>
X-ClientProxiedBy: SJ0PR13CA0035.namprd13.prod.outlook.com
 (2603:10b6:a03:2c2::10) To DM8PR03MB6230.namprd03.prod.outlook.com
 (2603:10b6:8:3c::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM8PR03MB6230:EE_|PH0PR03MB5847:EE_
X-MS-Office365-Filtering-Correlation-Id: fa6deb19-a6e0-4ff1-4298-08de30a517f2
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?DQfg7CY2NKkovQ2DeioFJAXYUqxHoEViv0J2/OHWy3LJBvmfyznGPvzObN7O?=
 =?us-ascii?Q?OTC8fIqoQIyNY1W+t+AgcG1LrS5F2b/IM1v2G+fjRH7onoipefGGfA9uQ8fT?=
 =?us-ascii?Q?bHXbqkctxk4suhZ+8LGVEdeUdc0IQ0MLA1+d6oSWbqxbT52hSyJw/Pv8dTLy?=
 =?us-ascii?Q?59c5llV+N1Jez9RFBw+hh2WX+HrKmw+kJSu5dKHR+3DmRGOiyqGixv5NVhCm?=
 =?us-ascii?Q?pogmpUp0BRKi9sK0CP6Up8xyC7SOkHfcag7FIoGHoXHehjghokPZT+4a5xJS?=
 =?us-ascii?Q?xJrG/F6Qez8xQ314ezNGHP1In+ivL4biTQTLQ+LZjW+XidgEPFQNmKo2WaqO?=
 =?us-ascii?Q?tZfH234Q/xsLhOBAx7Q+zWDBdassn4EeXhqR9gWsUVd+fatsx75Jd8nX0ZpH?=
 =?us-ascii?Q?m5gRne/YXu3SYvrWk9gbF+zBhnKzcjgfeF0+5v0YuPs0WBZEKvgQO/3Quu1k?=
 =?us-ascii?Q?rtJcsaT4XYnaX1cc9k68uj1Bi9FFlHYdpw5wzvZ82B06do2DxuW4MgIIJCUf?=
 =?us-ascii?Q?r9eERjCw36GggQ1LUubokU0SZl/lYNwWO/S3JAqfQvTnKLMh1dm+sEIZ94LI?=
 =?us-ascii?Q?7jrDmqFrbO3aYAZCI/rjuVvCKDl/N8wN543g7gOokOzDfArxRlfH8HChZTb0?=
 =?us-ascii?Q?PZIptthnvQ/PKWy+EVQwFERpuU98vXgrgePZCxLwOmx2URfKjkSSMwTZVstw?=
 =?us-ascii?Q?dXlThRnnRG32JZ1buHbk0PZoqKhIkyqMIYmTIxjX4lsVAz2usCv7Taq/HfYF?=
 =?us-ascii?Q?s5IqNs1Q9T/myDTBwzD8q4tYYstaaBAWnI4UVjfzmjpciFDgaofqPgHmG99s?=
 =?us-ascii?Q?kolVIyWaH7KIuztrjrAs+LDjP+3OpDtGG6k8FvlgrLYSmbLZa2QrsAXzL+Ze?=
 =?us-ascii?Q?S+8aINNfsbeIsUpCIC7KwzYI7oUfyHbSKtafAaRpKqiEE81fYd1ddq2Mj9zv?=
 =?us-ascii?Q?txQT+sfk3ZWt+sarmghZAJST7HdU8ZIb8o1Se0r8zHc61ITfV+oz+BONzY6Q?=
 =?us-ascii?Q?hhJInPjtfLM1fm75jymEbd243MS2kdZQQI8rRsSFV17TDJUpR6gVDJ/3rPqI?=
 =?us-ascii?Q?ETgE/RBZgHEzoSzFp+mdkcqEyfNfSlY0V9fxBrts2vTT1qbsfpbdPRk6W2pC?=
 =?us-ascii?Q?5jxGk7G4EiLx0xeGDPau0kFGDi5TfuFraJtjTymQaoRzvKedRv+fzoCu3vSA?=
 =?us-ascii?Q?bnJYZYDpu8ZjdlBu94XjySlf4/BT9jvHs4HVwyVA3MxUH6opn8a70ndsQZMj?=
 =?us-ascii?Q?11uT1ctMeFFqkFQZ9XkIo4X7+y1Ddi9UAz1rBhiHvEHqCvE5NdFC6Z0P+mXU?=
 =?us-ascii?Q?5+CGPJFJr+zE8YiiDp3WavtwukFsBKHvT/5vFZIWtlFk/wiz2ELuYsNMU0eU?=
 =?us-ascii?Q?+q8GOW9rTxC7kfXjkm39Uxe5szP7fKp39WGXhn40R3Ma5Vr1C47j7LIL01Kf?=
 =?us-ascii?Q?JqKn2tewTjGPdqne2EpT+TlBWFNQ65Jr?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM8PR03MB6230.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?t2pFxKDonRtDGvCF0XSzk4kf9RepeHBU1CmXXc7Cdq02KQn5XJmPpv5T4C9V?=
 =?us-ascii?Q?n03MwJVoNOt6nXyJdVwFMAk4zB3aODWTQ6+MrC7YcCWn5LOdlUq22/cX2qof?=
 =?us-ascii?Q?dfZJjrWH4tqo5fShADUA8Tsl1yGYuX7C/Z7E7nQuA/wcyS3aNrjBKCWK8MAc?=
 =?us-ascii?Q?cDILWACU5s9Vkc267OHso7uZnrcrzIFYUHvCony5oboM499RVPn1jiOxRV9z?=
 =?us-ascii?Q?EokYSpIm9y+75F56/7RkyVbYcqWCooVOGbCZ2WpV+h2u/bWTfjq+LuUYD5nO?=
 =?us-ascii?Q?0wBIq/moOIfODiHzJOGd3gU6FwYIbvL/huM21alN0XWCxXJQRDZFNKz1zJTZ?=
 =?us-ascii?Q?R1FTgSpFYhI6g4GnY48nYEih6EgBPJX+89Lz7sAwpgLmsaIr5lFuDdOhE5a6?=
 =?us-ascii?Q?R4NC221CpR+C54Zf0ldx4Z/vKtWaoU6Q9jmrgJn2xv2szID+N1nu1LU8h+1G?=
 =?us-ascii?Q?1+G4S4E5skDaRKWYhxxrXYpI/SW+PUBl/W8wWOm0wmJOZqixyAkc4dYW2Yrl?=
 =?us-ascii?Q?1kKGYlL23llGjyGbrPbGoiECfL6g/Vo5pEHYO//6o4AMgXdAisieXGX1DP5m?=
 =?us-ascii?Q?Kzg2e/pQFigiqBihG8gCvSdtzbQ1RCeCDWziiBNUHHJGq+uiHQBUntYpNw3s?=
 =?us-ascii?Q?PhbF3ys0SDLaY7Wr26xozMKddDxKxHi+ouHYtvZaa6NU7mKqlXWFvQNeSYyL?=
 =?us-ascii?Q?QvP0cLGZJbwP4s2ri5ZyOsKWzaKDj++El//OHjr423GWKS70EVW+n+Tx2Ia5?=
 =?us-ascii?Q?cJFY1LRnAqIpf15RFBooxrc5Wu4Ji0HmDOlTKpcjEtvMSzYlAs8gxoy+Beld?=
 =?us-ascii?Q?FEXQHrakEqsZbIkps2o9MWLC9fQyP+nRpxayNKZH+ZGfcikrRLphnCGM2J6O?=
 =?us-ascii?Q?myj/bIkdc3WcZXD4+i8rw9xo4Qa8mSTmHrqX9KluhGwjGS0sGhiR+6Ra9yUS?=
 =?us-ascii?Q?JeEAVtCpwmzEzKbjOtbTfssBFmX1J2fEyHdRG6aYKfllJjjMVjpjvqrgTKIf?=
 =?us-ascii?Q?PnVytiAp3fwvN6jEoF5CwZS+/V3ikhbccVJXReDNi/VLc3+7TCFrJgyqo90+?=
 =?us-ascii?Q?Hh6OP+MojVJL84qzjFVMnYUJsUs1Y9TLcoxygDlId8Xt+zi9Og7+0U/hLLkc?=
 =?us-ascii?Q?5wXNnPpa3FsiqMOzn4D1b3kuB5uGFP8sXBr7VnXeEdmdyVEgGZoiS+nJ9KZt?=
 =?us-ascii?Q?mF8pgIjj/AnIvAh3ha3h0FUqwOq8BndAIaF4mIXfMLU5JfT2Ded+Id2O/yA2?=
 =?us-ascii?Q?fq/XBuxDvhDHOcQ5eAB4ay5jCkQi2WGE7yQpZns2d1idXufninrFQB9MR7yI?=
 =?us-ascii?Q?Qp4AZdUdm1UQ3DlX0drn3edzyThocZVWA2RNeasHBajMYFBICIYfqLEpFdb1?=
 =?us-ascii?Q?taYoGJ7rWWYKZDEyYE60eR7cS/U1U9L7tcfbs2qkDNh21cYMVfEcw1oLibPU?=
 =?us-ascii?Q?hN4wcXHSNw13VIR6UzrC9g3UmLeu9YDkPj7u67JnX8toNffCxlIbFsvO1WlM?=
 =?us-ascii?Q?ZgL4wp2JYN7YQQpypkFDeV/WX9ym08clwyYrSZiEta0mhxOUd57QOC4J+6MD?=
 =?us-ascii?Q?4O2oGabfgjzxJmV2xhKPiqcP/3c05lnuA3MKDBBunJp/C1Ba0gbYKVqGfgc0?=
 =?us-ascii?Q?hg=3D=3D?=
X-OriginatorOrg: altera.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fa6deb19-a6e0-4ff1-4298-08de30a517f2
X-MS-Exchange-CrossTenant-AuthSource: DM8PR03MB6230.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Dec 2025 06:44:36.5244
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fbd72e03-d4a5-4110-adce-614d51f2077a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FdyprH3aCmY2T5ibllcYwu3w62ZUBufudA+DlpF4d8lvW/+ZNpJGlh33AzM8zBQ58JUxyM4GdV8rf5pPeAqHyNrMa+0Zl0PBqtPS4f2PgW8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR03MB5847
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251130_224440_779438_348098E5 
X-CRM114-Status: GOOD (  14.87  )
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

The DesignWare I3C controller supports automatically retrying transactions
when a device NACKs. This is useful for slave devices that may be
temporarily busy and not ready to respond immediately.

Adds a controller-wide sysfs attribute, dev_nack_retry_count, to read or
adjust the retry count at runtime. Returns error when value exceeds hw
specified limit, and the updated value is programmed into all active DAT
entries.

Signed-off-by: Adrian Ng Ho Yin <adrianhoyin.ng@altera.com>
---
 drivers/i3c/master/dw-i3c-master.c | 69 ++++++++++++++++++++++++++++++
 drivers/i3c/master/dw-i3c-master.h |  1 +
 2 files changed, 70 insertions(+)

diff --git a/drivers/i3c/master/dw-i3c-master.c b/drivers/i3c/master/dw-i3c-master.c
index 9ceedf09c3b6..a34b4f05dbd3 100644
--- a/drivers/i3c/master/dw-i3c-master.c
+++ b/drivers/i3c/master/dw-i3c-master.c
@@ -204,8 +204,10 @@
 #define EXTENDED_CAPABILITY		0xe8
 #define SLAVE_CONFIG			0xec
 
+#define DW_I3C_DEV_NACK_RETRY_CNT_MAX	0x3
 #define DEV_ADDR_TABLE_IBI_MDB		BIT(12)
 #define DEV_ADDR_TABLE_SIR_REJECT	BIT(13)
+#define DEV_ADDR_TABLE_DEV_NACK_RETRY_CNT(x)	(((x) << 29) & GENMASK(30, 29))
 #define DEV_ADDR_TABLE_LEGACY_I2C_DEV	BIT(31)
 #define DEV_ADDR_TABLE_DYNAMIC_ADDR(x)	(((x) << 16) & GENMASK(23, 16))
 #define DEV_ADDR_TABLE_STATIC_ADDR(x)	((x) & GENMASK(6, 0))
@@ -295,6 +297,64 @@ to_dw_i3c_master(struct i3c_master_controller *master)
 	return container_of(master, struct dw_i3c_master, base);
 }
 
+static ssize_t dw_dev_nack_retry_count_show(struct device *dev,
+					    struct device_attribute *attr,
+					    char *buf)
+{
+	struct dw_i3c_master *master = dev_get_drvdata(dev);
+
+	return sysfs_emit(buf, "%u\n", master->dev_nack_retry_cnt);
+}
+
+static ssize_t dw_dev_nack_retry_count_store(struct device *dev,
+					     struct device_attribute *attr,
+					     const char *buf, size_t count)
+{
+	struct dw_i3c_master *master = dev_get_drvdata(dev);
+	unsigned long val;
+	int ret, i;
+	u32 reg;
+
+	ret = kstrtoul(buf, 0, &val);
+	if (ret)
+		return ret;
+
+	if (val > DW_I3C_DEV_NACK_RETRY_CNT_MAX) {
+		dev_err(dev,
+			"Value %lu exceeds maximum %d\n",
+			val, DW_I3C_DEV_NACK_RETRY_CNT_MAX);
+		return -ERANGE;
+	}
+
+	master->dev_nack_retry_cnt = val;
+
+	i3c_bus_maintenance_lock(&master->base.bus);
+	/*
+	 * Update DAT entries for all currently attached devices.
+	 * We directly iterate through the master's device array.
+	 */
+	for (i = 0; i < master->maxdevs; i++) {
+		/* Skip free/empty slots */
+		if (master->free_pos & BIT(i))
+			continue;
+
+		reg = readl(master->regs +
+				DEV_ADDR_TABLE_LOC(master->datstartaddr, i));
+		reg &= ~GENMASK(30, 29);
+		reg |= DEV_ADDR_TABLE_DEV_NACK_RETRY_CNT(val);
+		writel(reg, master->regs +
+			DEV_ADDR_TABLE_LOC(master->datstartaddr, i));
+	}
+	i3c_bus_maintenance_unlock(&master->base.bus);
+
+	return count;
+}
+
+static struct device_attribute dev_attr_dev_nack_retry_count =
+	__ATTR(dev_nack_retry_count, 0644,
+	       dw_dev_nack_retry_count_show,
+	       dw_dev_nack_retry_count_store);
+
 static void dw_i3c_master_disable(struct dw_i3c_master *master)
 {
 	writel(readl(master->regs + DEVICE_CTRL) & ~DEV_CTRL_ENABLE,
@@ -1598,6 +1658,12 @@ int dw_i3c_common_probe(struct dw_i3c_master *master,
 	if (ret)
 		goto err_disable_pm;
 
+	dev_set_drvdata(&master->base.dev, master);
+	ret = device_create_file(&master->base.dev, &dev_attr_dev_nack_retry_count);
+	if (ret)
+		dev_warn(&master->base.dev,
+			 "Failed to create dev_nack_retry_count sysfs: %d\n", ret);
+
 	return 0;
 
 err_disable_pm:
@@ -1617,6 +1683,9 @@ void dw_i3c_common_remove(struct dw_i3c_master *master)
 	cancel_work_sync(&master->hj_work);
 	i3c_master_unregister(&master->base);
 
+	device_remove_file(&master->base.dev, &dev_attr_dev_nack_retry_count);
+	dev_set_drvdata(&master->base.dev, NULL);
+
 	pm_runtime_disable(master->dev);
 	pm_runtime_set_suspended(master->dev);
 	pm_runtime_dont_use_autosuspend(master->dev);
diff --git a/drivers/i3c/master/dw-i3c-master.h b/drivers/i3c/master/dw-i3c-master.h
index c5cb695c16ab..45fc1774724a 100644
--- a/drivers/i3c/master/dw-i3c-master.h
+++ b/drivers/i3c/master/dw-i3c-master.h
@@ -51,6 +51,7 @@ struct dw_i3c_master {
 	u32 i2c_fm_timing;
 	u32 i2c_fmp_timing;
 	u32 quirks;
+	u32 dev_nack_retry_cnt;
 	/*
 	 * Per-device hardware data, used to manage the device address table
 	 * (DAT)
-- 
2.49.GIT


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
