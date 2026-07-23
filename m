Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBD15C531CD
	for <linux-i3c@archiver.kernel.org>; Thu, 23 Jul 2026 09:29:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=hN/ZvRdSKT5VSmSsV8QReGaldSSUESV3wPeHKIBVXU4=; b=Ub+GT6+qgluWGn
	GLsAAjl4rQZYyvgdqdzAg+Q7Qpmg3wQqH44lO41+G8vznufS009sN1rACNb3qrv7wwTRM5/wu+JMv
	2PnqMPaJQqum7sYT0f5ARfK+tWh+YbQ5QmlzGZ8If1oR0gfS29RAWSsqxY6gdG5YmQtHmqf2sgHFv
	hPaLbOWHmLqwQxn34XvRQGe1Si08lZ6tTvw6x9Y4VsDUyYSYqAxH3i5LOGEfhM1ZQC8yU5ZPr9ga/
	XoRAdO9ISLKE6xmh7zCO18YE8BQ7VJsk7NZBbTy81nSu38R1mFD6JXO9mlfJ1Cs8PzLY4eIniv59l
	qSkRWJe/jWkeevccOJVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmpk9-0000000Dqc7-2Tl9;
	Thu, 23 Jul 2026 09:29:29 +0000
Received: from mail-centralusazlp170100005.outbound.protection.outlook.com ([2a01:111:f403:c111::5] helo=DM1PR04CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmpk7-0000000DqbC-2G70
	for linux-i3c@lists.infradead.org;
	Thu, 23 Jul 2026 09:29:28 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xXGiKTjz8E+fcUPOXp6BOiZfTK8oGc/LM1EeEP2ka4DUNmZow+mBtWp05HAaTx0n4Dlgl2a/lBWRrKu0CXQODWjmbri3bilQXA6X6SmbiXJpk5kd6isbGtXNU8xwa1Nte28d6efUpj88JBUwpXQz0yLvQ5rKTL94mMhyt5haIykjz28L9JcbCvdmtoTLZUBiX7QZf79cHf4j1c2okSwVSwv62gzw1zFKlnDbeY6EV6Sc4Ts+mSwYD6qf9JVY6F6OEJd1V8ixmQhrXwLMD3fpxRMCIh1BYZ5oBsfdx3aVl0Qf0W1TmZzMs+FOS4a7yVUz2l/xlWPtzdSw5o7JxKmD3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ubOVl7JxdnAt/lR7qrxlFl3ymI1kkLqB1STvQUBf5XU=;
 b=qAIMiihVP+1320c0ISA+A5ZBvRwPi0uNwROsTlF7AjwNqaKKsPTliuWM6mOMhvAJB1cl0GsMQyryYRFA1H4G9t5F8PD0SQiwtFnyNU8MfCfibju5g16TQwPtCO4PILyWeghwNTnLG7kLHIVB2pBBsaS5788me1zcQuXqkrVthJRZ6mLxTrxDsoB2DJbzg+4CWT68HubxQ+2sXaXWsymrtwLnKG6AUfvAvoNQjYqsrVzOPcFKo9KMEk86D2+9nELfKNt4JUKFUOqfNbVyhSJRXeNflRyy0JDsUou33b1vmTDribpm1Qu/FxrjPN7SDp1qHy0Ktc2YoxKoDy4tZ1j1TA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=altera.com; dmarc=pass action=none header.from=altera.com;
 dkim=pass header.d=altera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=altera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ubOVl7JxdnAt/lR7qrxlFl3ymI1kkLqB1STvQUBf5XU=;
 b=F+7xPUub36g4uZZpw5Qw8Ulvh1CBmc0vGUuzIGbQ74LUA6h8Haf/Nmx586b/DPqOJMTGrY3Sbn0UI6QMW9onpsgqGnUUGVsI89493//VJccS+2qxB1hIujqjxg3u22wdjKzp8Z+8NJIenA7RSEfC07CGA5qZK+WeQi3gfoxDAxm7TxaJ+79rUsGk/9r+3EOkf2sjD+p4oY+jPVMmBk5zG/qVwHjz9Qlo4L+UDHRl2Lf1prPJupenSSsJbV36UQOuF+d1HgPn9nMgR/8O+3/ZiXo7qN/PJrFIzToBKbMbh7qGQuKqzjc0Vg2STiY2NsiXXD74U+JQaXzHmihYEd3Okw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=altera.com;
Received: from DM8PR03MB6230.namprd03.prod.outlook.com (2603:10b6:8:3c::13) by
 PH0PR03MB5893.namprd03.prod.outlook.com (2603:10b6:510:32::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.245.10; Thu, 23 Jul 2026 09:29:20 +0000
Received: from DM8PR03MB6230.namprd03.prod.outlook.com
 ([fe80::abad:9d80:7a13:9542]) by DM8PR03MB6230.namprd03.prod.outlook.com
 ([fe80::abad:9d80:7a13:9542%3]) with mapi id 15.21.0245.009; Thu, 23 Jul 2026
 09:29:20 +0000
From: Adrian Ng Ho Yin <adrian.ho.yin.ng@altera.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Frank Li <Frank.Li@nxp.com>,
	linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: tze.yee.ng@altera.com,
	lkp@intel.com,
	Adrian Ng Ho Yin <adrian.ho.yin.ng@altera.com>,
	Dan Carpenter <error27@gmail.com>
Subject: [PATCH] i3c: master: require dests for read CCC commands
Date: Thu, 23 Jul 2026 17:23:10 +0800
Message-ID: <153608c2ff6504fe29f5f727a23c53c41768a44a.1784796086.git.adrian.ho.yin.ng@altera.com>
X-Mailer: git-send-email 2.49.GIT
X-ClientProxiedBy: BY3PR03CA0001.namprd03.prod.outlook.com
 (2603:10b6:a03:39a::6) To DM8PR03MB6230.namprd03.prod.outlook.com
 (2603:10b6:8:3c::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM8PR03MB6230:EE_|PH0PR03MB5893:EE_
X-MS-Office365-Filtering-Correlation-Id: b6697251-899b-4f84-6750-08dee89cdff3
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|23010399003|376014|18002099003|55112099003|3023799007|10067099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info: aalg6vREG88b3LDJbGpCCcziDGwtdyOnz+kQ6h0Fl76s2U6eoeweULGy9br+9apwAxmmI1CtKrBSy4bw4ycSpVsdD+W2ebad4irZv95QLjQCOpQUUFGKrl8pIlJdgncyvy+dO30zY3PgQrCRZ9bFDH44UrxQFd+M9T8njx4RI2rrm9ni/uTI2zQT6czag2ICd64xnaAA98AFYdbklO6qnRpKzOGJiPTDiGjJ26pan6aElVpz+XmjV+uw11wKACWJ6JalzngrcXSlrDXiD8us55HkkB/NGnOPKadtzB/62gaXCI1HpekilPpw9Z60Adm18xP2HHoMzUz/CzROjAcCgKMhy3qD7jHFenklNFTjashFzpEINAmRA6y+oXfjESV/I67EQqHiZFTkLA763yL1cal6taWJ7+kBvpZ46xFHAs9eYO+KnqAWa57ThQ6t9PKnflVA2OuMBXWlYpRmQT9Gtpyc/1Dyl+HBxPEGWRK9DXOdoGEHqi4mzPYniF0UNQjaRZkYQGpct4u4T5Pu29x76VsXLzwIiWatw8r7m7yFjM2Dh+RrW3Gk+mQkXe/DBK3InRst9npkFyZHDo9gbZaKX7bqhLcyCc0vLtMlpwhOtsGrhhw6fPyL9KREP62Eno2nyqucm/yaCPJs8MJNigIia1HtfY7uU/Z0o6hDVSSEnkQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM8PR03MB6230.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(23010399003)(376014)(18002099003)(55112099003)(3023799007)(10067099003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?nLlKNR4F26sMY/L7m+CfjmZ3lDVCvHxgNQHr+kbHxdW1XFQMIKXOLp9DWoTm?=
 =?us-ascii?Q?IjwBQXu35OV7TcF+iWvNjWzvPBPjevOFiRTtgf9VcjFHC29MZHvKpnG58xjZ?=
 =?us-ascii?Q?RLtICUkHR4FKGvaQt8da+9sxUv4f0hu/sBSY+glnNYMb7tX2r7YzsT2T2yjq?=
 =?us-ascii?Q?rrvcOH3WAT6ojTfYUHTG7BxES39LwCDhBDiOY9AHkjfVb1ZWT+EeP00JCtwG?=
 =?us-ascii?Q?/wxXjbIB1hqLMXYI2zd+E2aLIMd8oz//kBvZa44YWdZ3ypOveGzBgvx+GcqE?=
 =?us-ascii?Q?5R6/6klRpZaEyriZaEYqUMkJu7m1LVIJ0PRdNAWADShPZKcDgkx7cwSS1PAm?=
 =?us-ascii?Q?o8A5NY2zEnpnr+9FT89uWrAeM90WJA9RYWH3g+QGFZmHrvGSkkyqZ8xHUaXB?=
 =?us-ascii?Q?itV0I3DKvQaoh53hNXGfC1kNzO3M3Ah46/AV5QL2iccFeT2Vsyc/9uX0Pzn0?=
 =?us-ascii?Q?AFydogabioOu5gjvpHsyWExO415fXafSra1Cuu86pKPyCpLkMb73l4II0fye?=
 =?us-ascii?Q?L38E6mFG/y2KhSjvW259Ui5xCFXGSVH4gQDz9eBmgu8o4rujkJVgATFuZy1T?=
 =?us-ascii?Q?4/9qiNLsfosdDpXCwCnHzLXcL2g3gblsp/ur6mXwVA7ORWAXIBmRCmwVPxVm?=
 =?us-ascii?Q?YCrD4wiflvHzRFLIuGOPW27okMa9tPp5qQdPgtbMyVtHVGzyBENa+6EdMvV6?=
 =?us-ascii?Q?s8JCuCC1yEqKtw0sRw/sV5+QbuqXOVaHPpRy8LcLEnS+RSt4ykds1ZTPCFpa?=
 =?us-ascii?Q?Sm6Tguiy65WfDwigIVizgk5NwG87DYonnURM1SjVF+xuWB9YfZIH1GVwqm3d?=
 =?us-ascii?Q?2Oa0OzlYb7T9XdE802ZEeMsukd2wBuwSaSzlWGqftnq1M5HUkhyf4fVBN1T+?=
 =?us-ascii?Q?RV4+PNarzXDb68aLu38BdHlUBREZFeDIEBw0WL1+mPuZ8U6MGAKGv+q8bmYD?=
 =?us-ascii?Q?UFC2baiAY8WEHvzFP1KFXebyAjCi2sfxB8/cgKFiHnasZpxHfxJ2tSUd9E+l?=
 =?us-ascii?Q?9i/DKB28ZiXC47IIxOI9MNRC9fLWZ0D5UlJNel8L8SuvLG00U5kgo/q3SYDQ?=
 =?us-ascii?Q?9Fpafs3tMWJduE0KCeH+opKWgRNPiUe6dqX2IjjjyA/7ilIYNBWTexFgnp/g?=
 =?us-ascii?Q?RjKthVuSYW/ePwkxwlBALKfNgX7jLSzk5KpIxz4dTDtWHkpOnivUkmTbSwX0?=
 =?us-ascii?Q?5F/ys9+1pHZRpGbpmh6rHdUGFnAkiBgex0YVzL6SXQdVIm5XfixdEqyIwQH1?=
 =?us-ascii?Q?HK8g/9NG/pUXc32xeVd+E+EwrIFJz3qLBnhKAJgl7KiaQde9WQGJco+mVp0l?=
 =?us-ascii?Q?o0iz0kPK0RJwK3cM9qj+SwSbumV3hvXKlusHjF3kN19/9HcGO8o2dsn/t7lj?=
 =?us-ascii?Q?OuL0rDUFXFuZjsnJw1/S4drONX9CaHeavKqm9u604vaXN3BL36gVSr1N9pPE?=
 =?us-ascii?Q?Zi98hMjXsWzSzG/ExfGlxzEaWCgF1DYTr+d4lv2eaqKJjJSBb0qTcjDf78Y0?=
 =?us-ascii?Q?8/6sM88XsJTNEfcXzYMa08RQ22Ol/bp0aky1NnzVwmPVzJ8wB44bYheczFDv?=
 =?us-ascii?Q?U/BKYkfMAWpC/FSLErzqWs/RaOkbc6m8eJrWVJOYsnMMbeDmLdhMBAKg0WLz?=
 =?us-ascii?Q?w2mhiLgVCjj+7eb2oy9LYkXJT1DWI8+3DnWIBclWCQ3ES4HC8uT4NGm4m/s3?=
 =?us-ascii?Q?Xdc+2nM3ri8y/lm/Go9OG/Hj6waVHXqV5pC5rsdcqYOime2azTvWDX6+D26D?=
 =?us-ascii?Q?DKQifmF7ETst2JvoJn03kYAUhcxhCMs=3D?=
X-OriginatorOrg: altera.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b6697251-899b-4f84-6750-08dee89cdff3
X-MS-Exchange-CrossTenant-AuthSource: DM8PR03MB6230.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jul 2026 09:29:20.6814
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fbd72e03-d4a5-4110-adce-614d51f2077a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: //+T5T/KKyYRKMrRIgOhVIptU4hXPYY5HlSsgad91lztMqhtr5GCjcKrHBdDr/I4/bgsgtc2OisYKfZz0N+i3S0nqJ5PAPZhCtDVKfqbXrg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR03MB5893
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260723_022927_591691_076048A3 
X-CRM114-Status: UNSURE (   7.73  )
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

Read CCC commands (rnw set) always need a destination array to store
payload data. Extend the existing direct-CCC validation so cmd->dests
is guaranteed non-NULL when cmd->rnw is set.

Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <error27@gmail.com>
Closes: https://lore.kernel.org/r/202607222347.TXH6r6ie-lkp@intel.com/
Signed-off-by: Adrian Ng Ho Yin <adrian.ho.yin.ng@altera.com>
---
 drivers/i3c/master.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/i3c/master.c b/drivers/i3c/master.c
index fd3e79d10c84..0249886d319b 100644
--- a/drivers/i3c/master.c
+++ b/drivers/i3c/master.c
@@ -1039,7 +1039,8 @@ static int i3c_master_send_ccc_cmd_locked(struct i3c_master_controller *master,
 	if (!master->ops->send_ccc_cmd)
 		return -EOPNOTSUPP;
 
-	if ((cmd->id & I3C_CCC_DIRECT) && (!cmd->dests || !cmd->ndests))
+	if ((cmd->rnw || (cmd->id & I3C_CCC_DIRECT)) &&
+	    (!cmd->dests || !cmd->ndests))
 		return -EINVAL;
 
 	if (master->ops->supports_ccc_cmd &&
-- 
2.49.GIT


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
