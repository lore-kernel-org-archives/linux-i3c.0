Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45F56D3ABEF
	for <linux-i3c@archiver.kernel.org>; Mon,  8 Dec 2025 07:14:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1j3QOij+bdPTVbyIOiaeY5BXQW3Xv4D4tobJyBwkETY=; b=WJwjGcBrF5cGdk
	5JZ5x5K2SMzqaEHVPSQUyMsJOnZVXAdt/8mYqNq1z4jxyN85/3zKTQv1puaxXXAxWfoz4tg+4KMn1
	B3/TC7SEEwqLLdkqyNQdZv1R4nZEq2aBNtk7AZ19n8EQmdzpw/Ll1v6INfMrJrnv1WyMyuapE7aWH
	4svcdHRhjuaxF/JFuaURgXL9Kkghnzpiv6yGdIC0e4dK9cZELzb/9TIZ/rdesfIJNOl9VlZtLmYv3
	k8o50CxVQx76wHmcBSHxCF8QomunE23XUzOGFwM8Dfr3TlgrzTGfyZIQPgVALsj273uPHDa05jUSM
	ORwAlLffBT0ELFuyRItw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSVRd-0000000Cjez-03zv;
	Mon, 08 Dec 2025 07:14:05 +0000
Received: from mail-westcentralusazon11010030.outbound.protection.outlook.com ([40.93.198.30] helo=CY7PR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSVRZ-0000000Cjcm-3jeh
	for linux-i3c@lists.infradead.org;
	Mon, 08 Dec 2025 07:14:03 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=i1l19ZAxvAg8EOk/jnIWZfFWgDP3z5opHPt6JN6m8GhhQoxfuHVWdIp4asgKn2gUZTogUAlZN1k1kicxnYzpXQiHLgQeS4FQ4cKrLnKtzRmqeFJtDgwZ6egnByL0STUT5uO6hDhu4608S8jiajDP0DhwF1+MZLKoTvUIWcuQUWKsko/iex7DZFdpQdJa2HjIfjJ6F3BFnJ45vOGLQz6dDk0jcGXEPZgUi+IzrjnlseIGIGpMqyjHFbarq0lCZcynKsuYUcPYTk3ZuN5PeVbUwcar+CaqEfz/biC5BouKXnDU942tR/+BbaXGnqHra3m4snv7klxCvdZLJK7jEvcdJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vOLHnx/9IBSlMK6fF463WP3obguPRwXjgeAJMXuBphk=;
 b=y8Pgpz8aG6v+VxnqhqH79EM6V2tfSf44AMNq3dffviVQzibNxpoRpycLy1hQvToezVUH/tuodYl/6JTxzn7r21fRW7rhjiIv9OG+RZgJY8p/UaFlP563Sunyghj9X4SeTq/XVbPJ/Pblg3H3b6EUXyOIYZLFJnOpTvJJ45Upuuav/Y3phfe6XZWT4vS6w5uoBGBF5PMp9b7bTm+yVaqTsNuQUQb9kX4VbHigf0ykH8OGleFjj8QB38+79xwcTumHmuLKEI1dQqfai/YKjxsmo8NEKybxWq9lenY6nF6XiF9rIsPH4Sykwr+OiLqGgth8sGXzZF28ddc0ddB9lytLzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=altera.com; dmarc=pass action=none header.from=altera.com;
 dkim=pass header.d=altera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=altera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vOLHnx/9IBSlMK6fF463WP3obguPRwXjgeAJMXuBphk=;
 b=rCsJZQMNx1p2B7soDIfQVx6VxGXfpXogYuS/Z2ZNi0mG9WIp0PDhl94CnrKoMjXt8KRTD9rX1LGEiCvm8XWoaOUlL10QX/qnYmiDbNjXnuBKRSWi5GvMMBP0cjlAUC0VHyHzgOTav4edUCdogDH1OTErN3LUWVe9TreASGNdX3fIxOiwGA7msuPODGCL7d+7Zw5TjQ7UrQS6Y36CSZySlMb0feduSF2rW8JgToixk2Nnk3n9OpQqJWiDJJUBF//0mJzkkXPjuDzkFKeYa6mkkW2WYzSUnF1ZmXYXoUZaaFJ5n6G0Dv6ZWh0mL2U8nEWGQRLeuKOEYeel8ITmyDMMTw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=altera.com;
Received: from DM8PR03MB6230.namprd03.prod.outlook.com (2603:10b6:8:3c::13) by
 SJ2PR03MB7475.namprd03.prod.outlook.com (2603:10b6:a03:55b::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.14; Mon, 8 Dec
 2025 07:13:57 +0000
Received: from DM8PR03MB6230.namprd03.prod.outlook.com
 ([fe80::abad:9d80:7a13:9542]) by DM8PR03MB6230.namprd03.prod.outlook.com
 ([fe80::abad:9d80:7a13:9542%3]) with mapi id 15.20.9388.013; Mon, 8 Dec 2025
 07:13:56 +0000
From: adrianhoyin.ng@altera.com
To: alexandre.belloni@bootlin.com,
	Frank.Li@nxp.com,
	linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: adrianhoyin.ng@altera.com
Subject: [PATCH v7 2/5] i3c: add sysfs attribute for device NACK retry
Date: Mon,  8 Dec 2025 15:11:17 +0800
Message-ID: <39c0289a838af7e6bbc5736f0d114b2e895556b3.1765177110.git.adrianhoyin.ng@altera.com>
X-Mailer: git-send-email 2.49.GIT
In-Reply-To: <cover.1765177110.git.adrianhoyin.ng@altera.com>
References: <cover.1765177110.git.adrianhoyin.ng@altera.com>
X-ClientProxiedBy: KU0P306CA0060.MYSP306.PROD.OUTLOOK.COM
 (2603:1096:d10:23::7) To DM8PR03MB6230.namprd03.prod.outlook.com
 (2603:10b6:8:3c::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM8PR03MB6230:EE_|SJ2PR03MB7475:EE_
X-MS-Office365-Filtering-Correlation-Id: bc501ee2-8067-4e98-e0b7-08de36295a1d
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?ZINd0o201IBGKZ+QEHek6/lL68zrJAFoahscRoRiPiCIz/aLumDRZz4tVEkh?=
 =?us-ascii?Q?dRnNMqwK1z9ESBvJWNT1gR4F93jeKqELNlUQpFHpxazicJl6416Hk5Q0NLhl?=
 =?us-ascii?Q?jzViez9Z+Enk/17slhTIPUaqgyXVQ98MTH9sRj+anS2IZAZ5jZeaToDi3obN?=
 =?us-ascii?Q?JWbFvdwqSxbC6aTywxiwCnZx/oSPmt1qwLzsr+K2f4bDzYAAH2bESZnI80uq?=
 =?us-ascii?Q?gfhqVb3gLILE97kNi+fcCS9MTzG4xJdpncDoDVO5kixy+NW42QG/QNYp9v5Z?=
 =?us-ascii?Q?WZDu8kK0Ps9iT+BTZSyCUAJrh7uP4mYWOwVTHaMmb4q9BG3mcWvyUVPYL4B3?=
 =?us-ascii?Q?NFCcOwnljYPrUv5Ch9qNrjBgJx9XDpTlYZ2bY3mOcujrbPafiQoZF9FkWuPa?=
 =?us-ascii?Q?+QA8hNqPC0i7UTCnDlTScDeZtfZYtoBNk95/PoV1RxPoS/W6csD/gFdJQx/p?=
 =?us-ascii?Q?sx4IYMjq5mAELGtwzErEPAbtOLEBquJe10VOTRD5HRmSnLOOee5oa52Ucc1C?=
 =?us-ascii?Q?b2EE/MBH+0g+T1loRMIkNUJz+7FM0MW54hZdd+dX0Hc60q5+dvD9ddV4XplL?=
 =?us-ascii?Q?dYq78AtwhacnWezggUtYIY4+Yrzq/Qh8Gk/1+YvpwUrUHTBzkAQYyPJBy1et?=
 =?us-ascii?Q?INgRqWXZPPN43+MRD4OUvGR3Sb5OUK31eUWRt+nFpKTFGUXTUgyCwhDlv4xA?=
 =?us-ascii?Q?48NndUPMIcYekpOo4+9AYTn0MpOGxvV2mGDqWQ9GX2qAbp458eM6DzI2gQZS?=
 =?us-ascii?Q?XltlwtZE6NGcuvzqiFM9dU+Z+78V8mRQjDoBQ2hELWFe+8CqfWvJRLPQiuqZ?=
 =?us-ascii?Q?R5zl6mgqABAdlCc4rtuBLTJzWVTT8lFh2atBX/pLm8/smdtjI/jBosuX8k0U?=
 =?us-ascii?Q?bJgcYDh1JRx1NoZWC1AXMvui8vwFFHIKGYLdFKAplBgERIwQSvNefSzL2qHa?=
 =?us-ascii?Q?m1MrhCbqoupF/GYJ/khLX+Q4Am5YBpHQhyeAkVp1ZK7l6Cfq0UaWl6N5T9qU?=
 =?us-ascii?Q?A1hOfEE1+h8jMbAQGcNT/bQrBXCCQlaReF/9dn3Ald74hK2FSvZ8Ixkefsoe?=
 =?us-ascii?Q?XJHFsLIiCVGIFPy78rO4U/XXS7v/O23F4MHE1osSbPQKPT8BIZfQ28gp3gXv?=
 =?us-ascii?Q?S1U6UTu21yISCcQwlrWUdNi7vfEekSl8bTwK4Fk8BDHZexhOK0QHhd7eN0Gw?=
 =?us-ascii?Q?HJ2yERt8igcMDetAM56PegfwSw27Y3N6QTfhb7E68b3ppVoB9yjQ1NAV1rNI?=
 =?us-ascii?Q?Um+PQREa1Td1NTwURh0bLsRAfrpij+MFD/rlihaUfgLJgtXILqtLv0z8SZ8e?=
 =?us-ascii?Q?oyg/sMvT4Fh5S3hEzvo6r0k7OxhHKF9D8dLYbqq+0zac6JbwB7s0xXJI1e/0?=
 =?us-ascii?Q?i/R4qrvG7bXEsdj7j7JrOBFQFbftT80mdP6CyXVkahVjUJUoiZSNfgaTZXru?=
 =?us-ascii?Q?07gdvUSC0UfsoMnBhvvMIaVeyfxIP1R4?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM8PR03MB6230.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?RLGyOIuKFQPTYwjMQDdWerQmwD0VubDrWWlBgZXiWXGoBOZtRfgzYztfbnap?=
 =?us-ascii?Q?NoS3FckglLNoJMtuEo564hPeqicPwtdBM1FTPU7O9DMaCVAsQzWb8mbRmwW+?=
 =?us-ascii?Q?wBoRBa766PHD8suujf9TnVTgWABjVo06IfkXLizMWpsVbmvLdRtaH+y58kON?=
 =?us-ascii?Q?vRzXOU0qtKk6k91AtihefRcyhmR4oG8pzMREDBICsjUfrl59SsoKAgzJo3YD?=
 =?us-ascii?Q?wALIX4H2b7vX9Ysj8feJ3VIKDJn+WUNScydP6qijDdp4e56yKIbX5+eD0qSl?=
 =?us-ascii?Q?yXJWwsVpZCnr3v7wR+vspzZ24C+gOWy21Zu2NMYDoJQkUef+n7rNHndEmRLo?=
 =?us-ascii?Q?cM1rRHxHDDoxlNQrwOvEJJ2M7dJPrK80OsSGwRNcFwy3xnxG3nX2kGMagByz?=
 =?us-ascii?Q?cgPxvK3SqTDOWV+Tjo53Id6beeYPtFndWRBlz/F/puYdL+uWE504jr+1bqxY?=
 =?us-ascii?Q?khjFafJ/Am0xdmfBDwyVi6N8dOYDet2WARyHV1nP0Ff57BdPsY//QHHlYg+a?=
 =?us-ascii?Q?sNuoX2LfjRTaWSDwEm+NJ5m5ger577XfvUT+mkOQ5yHG8eN5UbuOXNAiTL9w?=
 =?us-ascii?Q?YKJeWKyxp4j1PUgZ9UOYUY6fqYeasvO6o9sr9FbW0I7oDA6kaE7NXc6guTNS?=
 =?us-ascii?Q?yo06TsIAR0++s/VOdducO8juZfR/5IE1IZTcTE7Bib8B0PQJjwUMxKaREM4d?=
 =?us-ascii?Q?VzW4smlbEgZE07aIVRw302OY6PB0IBx+hFpKBzd851rZp34Tvh+v+RG+NDcn?=
 =?us-ascii?Q?VDxxun3NKCmk8F0TUpG/+8M1SIgaB1oV3GClz7a0j04vsT5mrPrK6JIKFgd2?=
 =?us-ascii?Q?4nm+TegbTTJyRIkKed8LFjW3bnrEw2HrYWfWMo8WhRkUfUltM6v1ZHfSRyXL?=
 =?us-ascii?Q?P/yjFRZusRfzOZrBgyBpdyxXbaUYd9ltOJ3rparmJfKB323+CrdVI2BCQpdu?=
 =?us-ascii?Q?Dp2yuw4ofy8qRjC7fWXHrvWV80zbIg8qiyypaPf61IoIJP3ZNZ7o/WcxcSGx?=
 =?us-ascii?Q?GbsAJN4Qx5+KiN79HPzxYgI3EaaCqp5PPWcb513tCqjBc7SLLd9Q/CQI9z3I?=
 =?us-ascii?Q?/sz0ZC4RPe2HTWk5nEJN3LY1kF3XqIEAZiT/qDzw1Btu6vCqcAIc1PVpBbrg?=
 =?us-ascii?Q?AF5OBZVnIhM38/nxL3wXQEXOaWedGNbE+lZzluEem3/uhGcaAVqs4FytqNNd?=
 =?us-ascii?Q?aPy+vGHEld7lELKUmlBkqNYxIvB7c8/zG6iZxHcarQFNGxF1ZH6fr0L6mPqn?=
 =?us-ascii?Q?glmBuzNWINT0NnadGHVkIStwJ1/8O5WAM5/v9xaFNP3A7xF3niSRLzzDMQFv?=
 =?us-ascii?Q?uBX6/VHFJ5rM5HSd3rOUV5Vh9YR4HQczlOUh7j+leuBEpwIyMzDMFm6blwod?=
 =?us-ascii?Q?Q2T+st5ztOEPrKsp3BC/d8RQB1RxgYDPKn+Np3QLDAutE14fTL+o4u7atIAC?=
 =?us-ascii?Q?T6ZLE50N0nxkU0IvayPEM7PsYBHV2NkFBU6fhA2AbRPL0eck5OuGDVlisWQT?=
 =?us-ascii?Q?HDzawkmXZ9SDGpOylb9jRGOiXp7uB/fx67Zt5a5GEY8KbdA5JYtcpIqRCpQJ?=
 =?us-ascii?Q?JZDJdaOhDwTKHJ+1mpo1NxWnouNPXxF4Us3m5gFAcZwughD7Mch6CLSyPsrX?=
 =?us-ascii?Q?Xw=3D=3D?=
X-OriginatorOrg: altera.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bc501ee2-8067-4e98-e0b7-08de36295a1d
X-MS-Exchange-CrossTenant-AuthSource: DM8PR03MB6230.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Dec 2025 07:13:56.8329
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fbd72e03-d4a5-4110-adce-614d51f2077a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WEj8u1neZ1WPlY04hNvFuTg3he2U15h2FxNRz5UQpLhx/HIpCTGu8kpOalFPUi1KfVZGQ+lf5Hfsg8fH3WgTt6YqPVbBxPHFtJ1Xx95dVkI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR03MB7475
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251207_231401_933837_C625B3A4 
X-CRM114-Status: GOOD (  12.15  )
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
 drivers/i3c/master.c       | 38 ++++++++++++++++++++++++++++++++++++++
 include/linux/i3c/master.h |  6 ++++++
 2 files changed, 44 insertions(+)

diff --git a/drivers/i3c/master.c b/drivers/i3c/master.c
index d946db75df70..2903725bee03 100644
--- a/drivers/i3c/master.c
+++ b/drivers/i3c/master.c
@@ -685,6 +685,38 @@ static ssize_t hotjoin_show(struct device *dev, struct device_attribute *da, cha
 
 static DEVICE_ATTR_RW(hotjoin);
 
+static ssize_t dev_nack_retry_show(struct device *dev, struct device_attribute *attr,
+				   char *buf)
+{
+	return sysfs_emit(buf, "%u\n", dev_to_i3cmaster(dev)->dev_nack_retry);
+}
+
+static ssize_t dev_nack_retry_store(struct device *dev, struct device_attribute *attr,
+				    const char *buf, size_t count)
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
+	master->dev_nack_retry = val;
+
+	return count;
+}
+
+static DEVICE_ATTR_RW(dev_nack_retry);
+
 static struct attribute *i3c_masterdev_attrs[] = {
 	&dev_attr_mode.attr,
 	&dev_attr_current_master.attr,
@@ -2962,6 +2994,9 @@ int i3c_master_register(struct i3c_master_controller *master,
 	i3c_master_register_new_i3c_devs(master);
 	i3c_bus_normaluse_unlock(&master->bus);
 
+	if (master->ops->set_dev_nack_retry)
+		device_create_file(&master->dev, &dev_attr_dev_nack_retry);
+
 	return 0;
 
 err_del_dev:
@@ -2987,6 +3022,9 @@ void i3c_master_unregister(struct i3c_master_controller *master)
 {
 	i3c_bus_notify(&master->bus, I3C_NOTIFY_BUS_REMOVE);
 
+	if (master->ops->set_dev_nack_retry)
+		device_remove_file(&master->dev, &dev_attr_dev_nack_retry);
+
 	i3c_master_i2c_adapter_cleanup(master);
 	i3c_master_unregister_i3c_devs(master);
 	i3c_master_bus_cleanup(master);
diff --git a/include/linux/i3c/master.h b/include/linux/i3c/master.h
index c52a82dd79a6..5a03e5aea6c2 100644
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
@@ -510,6 +514,7 @@ struct i3c_master_controller_ops {
  * @boardinfo: board-level information attached to devices connected on the bus
  * @bus: I3C bus exposed by this master
  * @wq: workqueue which can be used by master
+ * @dev_nack_retry: retry count when slave device nack
  *	drivers if they need to postpone operations that need to take place
  *	in a thread context. Typical examples are Hot Join processing which
  *	requires taking the bus lock in maintenance, which in turn, can only
@@ -534,6 +539,7 @@ struct i3c_master_controller {
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
