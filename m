Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C767D12694
	for <linux-i3c@archiver.kernel.org>; Wed,  3 Dec 2025 07:23:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=U9Yhx3of58pNBSJ+GVaR+BZrYBGx/Jc/jbf2tklLs58=; b=TpQgSjFfkJHyUU
	wRivqpvWo49f4l9Sv1scYVGWYviX4kVJqOjKJYwKnW+JyJRKD5UF1FZK1ufjqzSIH5yAAHrkV3pWU
	J3QwX1GVn6yksI22VyYxZ0K6R+JVMLcF3awAVLgEyX3wKaR2/02wOaRwZIBt6ixlKqDwFKt9xyz0L
	QkB3vupiTE+4hecH5yjoYBWa5WIfiK+U5NKTnHHazE3Bs3zcphv+/XIbE+TiMMlvMnb90hgCVEsfh
	rVcTmlERhqczlU5omWLYVfuzPNaSwize3wLCU5TT3/w2rPihK60v+sjxkkOvr1A7miPaJcvI97Zc3
	DjVRdLDs6x/XTmwgX4Wg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQhDH-00000006Fmc-19Sa;
	Wed, 03 Dec 2025 07:23:47 +0000
Received: from mail-westus2azlp170100005.outbound.protection.outlook.com ([2a01:111:f403:c005::5] helo=CO1PR03CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQhDF-00000006Fkm-10Cs
	for linux-i3c@lists.infradead.org;
	Wed, 03 Dec 2025 07:23:46 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=O0svQNafztEkYy9ScAjBgk282iQU3kTq86qWQBbRjSz9rc6qvP1idATl8CwY+yUqZBdnE4T5L4tIzBNjvAcKIrWF0RYb4OXaahZPd1O3ciaodm9b2V6PQTBP9206qu2tX8Be/UNg5Lynxq1uQUhVJrzOwa0mU+BSfYOxpt/+Qkh7LMBOwVp2Hk6NUEZHesU1/ubnrfWC7qCopomejw/JRvMFQ4/DYTqxlvzDQXZLC3bnlo3T0JnEMUfqOjEegbNitJLRlGrarj7Yl5Nd2maFFOimqW4WSyCwqj+wcEPSomOiFHy9dJ/zpYLf65Y0lqs2EnAdZKETna5OEmDvWQrzOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8n2jgP7re9xatp5ydsrJvB2NoZDchOQzhFwYx/IAiFM=;
 b=tYKNJLqcwAhJ8QdK5YOsc/lFkEqt9l15z8ugPYpSDxYBMv4mGqWQk9SfM8JLYfqmM5R43YlqPNqjtV9E2I613vEdGZwRy2FT/tYSCd7EK+xDGyDIcayP1SZeJjPiVgDdd6yTRaX0Wa2uZyb9FzVS0aBh3zgAVJHnmLmBP1hsx/F/jOAZ9Nl0yYeoGEL+iUVK/fXHW1Ic1zVmEnSeLYmUOjBVbQARabdmrbN5ImO1MTo+WLz6s+zNdKe9qoFptnD4DrvYcugNJRIDgcOy1+LpXhJKBHHT74xmBrM/qOHWRsp+p6TBiVCMSG3CbI9ETQp8c08qMBYSC/uXrNS98A2u5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=altera.com; dmarc=pass action=none header.from=altera.com;
 dkim=pass header.d=altera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=altera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8n2jgP7re9xatp5ydsrJvB2NoZDchOQzhFwYx/IAiFM=;
 b=DRh41febPf0ZvyGhFchLT1nZqJR6c0zD56r3zMS0yo4oStLDBX9vTfSQbYDz1R9BX8e5gKrf+g/djHAtBRcp22l4l0/Fvd/9q002uAActZea2JTgG5gzp1rJkZ2UuUebOU3hhb7bBaQxikcAahTdRpH5DdFnHB+JT4CIvevoZpV3l34bU5rZeti9pomnbr/27cvRwidogZcSIlDS4GqT+VGL/H9EqoA2Xjq5HUoJVI+YEW+pdlBSKQ7HhQEWIG1FN/mgtFaui8h+8XRNp3Q+ovLGl8LtYVlWjxPIksKW9kLibTcLQQBulDMVch+aaLslTkriQvrwFXE+vSiTanGSgw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=altera.com;
Received: from DM8PR03MB6230.namprd03.prod.outlook.com (2603:10b6:8:3c::13) by
 LV8PR03MB8140.namprd03.prod.outlook.com (2603:10b6:408:297::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Wed, 3 Dec
 2025 07:23:40 +0000
Received: from DM8PR03MB6230.namprd03.prod.outlook.com
 ([fe80::abad:9d80:7a13:9542]) by DM8PR03MB6230.namprd03.prod.outlook.com
 ([fe80::abad:9d80:7a13:9542%3]) with mapi id 15.20.9366.012; Wed, 3 Dec 2025
 07:23:40 +0000
From: adrianhoyin.ng@altera.com
To: alexandre.belloni@bootlin.com,
	Frank.Li@nxp.com,
	linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: adrianhoyin.ng@altera.com
Subject: [PATCH v6 2/5] i3c: add sysfs attribute for device NACK retry
Date: Wed,  3 Dec 2025 15:21:03 +0800
Message-ID: <a12dcd1eee62e7394c233ce67e0463d4c3767fce.1764746266.git.adrianhoyin.ng@altera.com>
X-Mailer: git-send-email 2.49.GIT
In-Reply-To: <cover.1764746266.git.adrianhoyin.ng@altera.com>
References: <cover.1764746266.git.adrianhoyin.ng@altera.com>
X-ClientProxiedBy: KU2P306CA0025.MYSP306.PROD.OUTLOOK.COM
 (2603:1096:d10:3b::16) To DM8PR03MB6230.namprd03.prod.outlook.com
 (2603:10b6:8:3c::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM8PR03MB6230:EE_|LV8PR03MB8140:EE_
X-MS-Office365-Filtering-Correlation-Id: d8a9eaa0-774f-4d08-e8d9-08de323ce1b9
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?mrR81gji/VbgByLngfdL62ctC+D7CwFJX/3/CujjVAJCbMzpGv6m5Ti94PvU?=
 =?us-ascii?Q?bRbtOrMmU/All8hK7Q5MslKKIXpDqyatBKqpy4nH6XGCymsX9q6WZKQx/vZ2?=
 =?us-ascii?Q?lUuINPa+w2FG1oWJ+A4Vdk7ZqV/x3eR2foWT7dm95b+Kw9Lnk5oJ6H5zhqF5?=
 =?us-ascii?Q?KXIz6pq/KGpx1d3aE7K8Id4Bem6O66KRxIugnbGsJepXqMg0rpK+/7Ch9vmj?=
 =?us-ascii?Q?YA6FZR19YmIOVDbxf7pWWrKPz40ArJgL0A3wb5i9hWxMBKwxfIzfWeRZR3T8?=
 =?us-ascii?Q?BcI9pImAuJP6F+B7+rFDkTN+ZDhxC2sOcXkMh2/QFO+kh5vlkL1NnBCM6Ez0?=
 =?us-ascii?Q?66c+5QgSb3RkMpH1Zu7SDZdlGlXEfcuD2Avx6bh3o3DvLHCSpbvp0IDU2JlU?=
 =?us-ascii?Q?EtCVpoPfyfS/X9Id2CE02uX27Ex7Ho/3BF7orNa1t9YLw7Xb5kPo4oU4x0v0?=
 =?us-ascii?Q?Z+uYmvHjoDyqIR7aLMsvtMlN1ecF1coryPOjKOVqaFVPHxl6ibo/CGSW4u7/?=
 =?us-ascii?Q?R2gxk7cJwhtmuyO0zR23wO5MVByBx6fsprMiMZ/gr6/V7oGNo2x3vIANLCdx?=
 =?us-ascii?Q?fbaE9mpywKhYDGk8E1XIMHeeKJxJ0P1IzA2RUK5YcLKJ7HKxjXHz8mIGEmoP?=
 =?us-ascii?Q?e6sZjb/nSOoYDVoXsfA/HXgmBFOqmKTHV7BFtHopxM3SkXR1U8W1LCfAodLI?=
 =?us-ascii?Q?rObqKj8592PKH4QaAxWWYnVPIk0rzKJqa4tGAZQYnIO/FUAu7GSiORkRUbWP?=
 =?us-ascii?Q?smisgVEmPdWlDLAm+bb0a7YwEThocom6ViD1j+oJLO8xaxxq9056YA8ksqVR?=
 =?us-ascii?Q?5RjsI2SfodQWKvjAjR2UGIxiXJZdDVqlZENT2OAiZSLpafuhRkPn3oeaPXpY?=
 =?us-ascii?Q?YlCax1f0KLSkhVG97Xlz8cbLb7Nr6/py/NRGF9izVUYuAYiLE4ya2oVshlqD?=
 =?us-ascii?Q?BXhlzQeDKmfFEzmSEezcz5zuk+W25pxnjUjwjmOFF0b3/BN7rEty2JAy8Be5?=
 =?us-ascii?Q?9A2DTRJnzUrcYCPF5e02ntJxjJCcj8d19MZEUd7Z3N9IOZdLuv8o9vbpnELl?=
 =?us-ascii?Q?nji3n5+iytHhxeQjHZHV6/HxOQPziY8F9iuDjAz2ylT/reTcwyETBL4WkJCS?=
 =?us-ascii?Q?fRf37/7AWplV9kWQfU20+CPYN2byDrsANOtoiQ2ZAWsVUUzoSupGAgmF9UJc?=
 =?us-ascii?Q?W80GAhVmIATalvLHBTqoApojHvA+XrbyYjazwGrhn5YmaZ/wiAR5QFxxfHbl?=
 =?us-ascii?Q?55HyV3qvlQFkoh+wP1X7whkiMhqMrxhsSMucKN3p2jH/XUJrtLyNvE5Nl9lj?=
 =?us-ascii?Q?GZAbO/xDsDTwALNxytylHcAneOdfqA2CJxvdgONW0DkMho3kgfB+m34M5H5z?=
 =?us-ascii?Q?lHz1zFCWQxNSUc2CwkFGbK24SHhgEoROvL7/eOtmDOBvyexIdb3ht1CHFPC1?=
 =?us-ascii?Q?DAfvO5E7fSfAujtWlYs6Hbk+Bj1itHvB?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM8PR03MB6230.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Jd+6GFJMkzVGsClIQ7WJqfEP/WIIbc+MWHKjlHx/WKZ00x+oAuzEr/MYmmBC?=
 =?us-ascii?Q?JaCCeBdvLDQSxbeeeVolW/EQM6PCMg0SqZ6muhBDBwuCSmRdRxlSgnAaOfdP?=
 =?us-ascii?Q?Yjucciufe6oBYctk/HNk/bPm5IGH85+sOSen5EnCR62XxH2vxFMxALXsSRjU?=
 =?us-ascii?Q?JwIqhyP6g49BSsNQgk+o/aTRBVMkQY3K/jAdvvNfMQ/vqVFU0zkiId5d7MYd?=
 =?us-ascii?Q?rggwaS4q24dWC8GBz3hAHV73EpVOs4OPc14EUjKf8O8sdfzL3e3Z9IeceNNx?=
 =?us-ascii?Q?6ehHuctotKrvLXomW592I/0zxivt4OPrWFBxlsRbgUBRWgTQYjXVb3L4HRdQ?=
 =?us-ascii?Q?5EhHcVUrkF5cCYrnpTgCgcrIlt97u0U1/+cBc7OH250ap3cGR6JMoDhGZ8m9?=
 =?us-ascii?Q?1k979qXLJGt97QwdJJX1dI47yAYHZ5zYX/5RQY4rkRyv189zoYbJgfwTkbMx?=
 =?us-ascii?Q?6EyqUpZNZIjqOr6ygxqYajBUXd1qGWjPDvwbrP9umodBOxfWFizf/uB18skF?=
 =?us-ascii?Q?0+1K9tSikNorzS6SdvxZtDTORoCNC+cTAT6Im4zUACMBHHpHUX5iXDVfkk9R?=
 =?us-ascii?Q?u/1WzVuW7UdzugZZ+WW9gTs6w8wBDECer7buHH2tJYgTCun8QevkyqfjpS0n?=
 =?us-ascii?Q?x2AbfMKM4M5nm9DeiPk+NnJrkMoCDrltcpKlADOTNh678PslZdCIjdZsLT+u?=
 =?us-ascii?Q?lnovIptA8OUMUfCO4w0u/gLezLv3FBrHchbUKp7+Iqp3HkhVBBM+CuqQuEDz?=
 =?us-ascii?Q?KUuanc7hOkMXEAg6atwc8tEq6Ggqo2sE0QEtSpLeUDwkgQ72fHd9syg3kqxZ?=
 =?us-ascii?Q?oWzF70U4PpgC5IlJy3TDtf/xXAlM6ZDxb5QIXkF+TUa5q9ZntT37jSV2/oON?=
 =?us-ascii?Q?45LrvsrerCko0C6WfUJ1HlbZcJKS4Oly2FRhfci8BM251YiXZ1WfZChWNdYA?=
 =?us-ascii?Q?0Fd6O0n5D6Q6qqXfqDPxrbOMra1xXQQFhkAiaeECtrMnunouhgXxeevZugyB?=
 =?us-ascii?Q?z0rnHYbe/xgipayHw4iZi0M78XKXRaCTcD4pT8HsTu3XeYWNSyH8me86vDHL?=
 =?us-ascii?Q?yIoq6Kkz6ZmCfGwyOvZp1BOtk9Akxd4IXNm1PxICYLbCDsmartKG8qBuGsIx?=
 =?us-ascii?Q?mez0obX1ufMLL4F9ixTa0DDMz3NkYpmA9smmdPWpxlzZ+Yf8YjMh/0JHyhqM?=
 =?us-ascii?Q?fGbgCfKnnKk/0136YzA0g1hDosynQdnMLcsdoChC0MG16TklHSfPsOop8fS9?=
 =?us-ascii?Q?k6NvkCffC6MWHFANN/CS5S8EvibYaXAGQjbfNAFIzIXkEJybohZp52TgFck0?=
 =?us-ascii?Q?u0J7nsFLZKLWFfBb5em/Caidi4W3SlNVoZTSllPchM6hupjaESV2XNaZRgxe?=
 =?us-ascii?Q?u2yfVwckS2llgO3E3khzZ4wXj1/FvMIR4ON/FQ/VdeqHMFaj/Do4CJSA+oJH?=
 =?us-ascii?Q?soEFfTrwoNf2aMIO3ndLONYuz0BA9sGdaAcLHkE8xnhkw1+JlIu/wyZ0tG7Y?=
 =?us-ascii?Q?WBE/d2a0ZTuGH1OnPSnfu3L0lZ4CCv+IyTJOn8XL9NMgULwHTbtByaMMLjNR?=
 =?us-ascii?Q?MwfHaYe4UtfL4djrjqC79tdgt/DEdP1ISYjvgpIa5+ito4i6ojIqfDHJRa2H?=
 =?us-ascii?Q?kg=3D=3D?=
X-OriginatorOrg: altera.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d8a9eaa0-774f-4d08-e8d9-08de323ce1b9
X-MS-Exchange-CrossTenant-AuthSource: DM8PR03MB6230.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Dec 2025 07:23:40.0636
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fbd72e03-d4a5-4110-adce-614d51f2077a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mlaeFdP2pZC09KhLDOeb6eFwcR5kFFPGoRdk6NtitpQf4NK0CP5FUMiBKeh+sfH3o06KQq3F+c2gYR1ifX+UZwMWNibeU15m9c1i1Z201q4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR03MB8140
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251202_232345_281914_7BC49659 
X-CRM114-Status: GOOD (  13.16  )
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

Add a `dev_nack_retry` sysfs attribute to allow reading and updating the
device NACK retry count. A new `dev_nack_retry` field and an optional
`set_dev_nack_retry()` callback are added to i3c_master_controller.
The attribute is created only when the callback is implemented.

Updates are applied under the I3C bus maintenance lock to ensure safe
hardware reconfiguration.

Signed-off-by: Adrian Ng Ho Yin <adrianhoyin.ng@altera.com>
---
 drivers/i3c/master.c       | 41 ++++++++++++++++++++++++++++++++++++++
 include/linux/i3c/master.h |  5 +++++
 2 files changed, 46 insertions(+)

diff --git a/drivers/i3c/master.c b/drivers/i3c/master.c
index d946db75df70..e67f54c6e865 100644
--- a/drivers/i3c/master.c
+++ b/drivers/i3c/master.c
@@ -685,6 +685,41 @@ static ssize_t hotjoin_show(struct device *dev, struct device_attribute *da, cha
 
 static DEVICE_ATTR_RW(hotjoin);
 
+static ssize_t dev_nack_retry_show(struct device *dev, struct device_attribute *attr,
+				   char *buf)
+{
+	struct i3c_bus *i3cbus = dev_to_i3cbus(dev);
+
+	return sysfs_emit(buf, "%u\n", i3cbus->cur_master->common.master->dev_nack_retry);
+}
+
+static ssize_t dev_nack_retry_store(struct device *dev, struct device_attribute *attr,
+				    const char *buf, size_t count)
+{
+	struct i3c_bus *i3cbus = dev_to_i3cbus(dev);
+	struct i3c_master_controller *master;
+	unsigned long val;
+	int ret;
+
+	ret = kstrtoul(buf, 0, &val);
+	if (ret)
+		return ret;
+
+	master = dev_to_i3cmaster(dev);
+	master->dev_nack_retry = val;
+
+	i3c_bus_maintenance_lock(i3cbus);
+	ret = master->ops->set_dev_nack_retry(master);
+	i3c_bus_maintenance_unlock(i3cbus);
+
+	if (ret)
+		return ret;
+
+	return count;
+}
+
+static DEVICE_ATTR_RW(dev_nack_retry);
+
 static struct attribute *i3c_masterdev_attrs[] = {
 	&dev_attr_mode.attr,
 	&dev_attr_current_master.attr,
@@ -2962,6 +2997,9 @@ int i3c_master_register(struct i3c_master_controller *master,
 	i3c_master_register_new_i3c_devs(master);
 	i3c_bus_normaluse_unlock(&master->bus);
 
+	if (master->ops->set_dev_nack_retry)
+		device_create_file(&master->dev, &dev_attr_dev_nack_retry);
+
 	return 0;
 
 err_del_dev:
@@ -2987,6 +3025,9 @@ void i3c_master_unregister(struct i3c_master_controller *master)
 {
 	i3c_bus_notify(&master->bus, I3C_NOTIFY_BUS_REMOVE);
 
+	if (master->ops->set_dev_nack_retry)
+		device_remove_file(&master->dev, &dev_attr_dev_nack_retry);
+
 	i3c_master_i2c_adapter_cleanup(master);
 	i3c_master_unregister_i3c_devs(master);
 	i3c_master_bus_cleanup(master);
diff --git a/include/linux/i3c/master.h b/include/linux/i3c/master.h
index c52a82dd79a6..ee254864c8d2 100644
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
@@ -491,6 +493,7 @@ struct i3c_master_controller_ops {
 	int (*enable_hotjoin)(struct i3c_master_controller *master);
 	int (*disable_hotjoin)(struct i3c_master_controller *master);
 	int (*set_speed)(struct i3c_master_controller *master, enum i3c_open_drain_speed speed);
+	int (*set_dev_nack_retry)(struct i3c_master_controller *master);
 };
 
 /**
@@ -510,6 +513,7 @@ struct i3c_master_controller_ops {
  * @boardinfo: board-level information attached to devices connected on the bus
  * @bus: I3C bus exposed by this master
  * @wq: workqueue which can be used by master
+ * @dev_nack_retry: retry count when slave device nack
  *	drivers if they need to postpone operations that need to take place
  *	in a thread context. Typical examples are Hot Join processing which
  *	requires taking the bus lock in maintenance, which in turn, can only
@@ -534,6 +538,7 @@ struct i3c_master_controller {
 	} boardinfo;
 	struct i3c_bus bus;
 	struct workqueue_struct *wq;
+	unsigned int dev_nack_retry;
 };
 
 /**
-- 
2.49.GIT


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
