Return-Path: <SRS0=oKuo=RB=lists.infradead.org=linux-i3c-bounces+linux-i3c=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=BAD_ENC_HEADER,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B330BC43381
	for <linux-i3c@archiver.kernel.org>; Tue, 26 Feb 2019 11:01:09 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8195320842
	for <linux-i3c@archiver.kernel.org>; Tue, 26 Feb 2019 11:01:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="IHv1pTY7";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=cadence.com header.i=@cadence.com header.b="bvsvVwGH";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=cadence.com header.i=@cadence.com header.b="s2EYCwWK"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8195320842
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=cadence.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rQt2FWUK2qdjgYhRZP/93p54wDV28WPs/W19soF9TAE=; b=IHv1pTY7Rk0N0J
	3qEEU6Xk9J2200FCRZgZRJdxxpvtYmQRiTIjvm3haWlQpYSYvHOyGEHEEgy6eJvQAWqpjnIaPCrC3
	l+l7YJEloChPLucQD/XfKR2xOYDD+VVg6CzMW5pxMOTgA6ipGOhJY+5UGX/rr8IdSx/J+ds57lqr4
	H8t4WCo/3k/GWn4WEQcEf7QE2NtwuN3Ssglqr8eV7HB07RbO6ZawentU+oWCAiCGYV5hU3CvpqGHq
	Msw54DpXT4r4Gu7fhntBLDZbYeAznJI/IX9iHreQ1MTMy2/+1o4nRyHmFMtkW+zxy7tOluLFgX27F
	Y+OdsGDT5X5dfT2+SHQg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gyaU1-0005AB-3H; Tue, 26 Feb 2019 11:01:09 +0000
Received: from mx0b-0014ca01.pphosted.com ([208.86.201.193]
 helo=mx0a-0014ca01.pphosted.com)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gyaTt-00058R-8A
 for linux-i3c@lists.infradead.org; Tue, 26 Feb 2019 11:01:07 +0000
Received: from pps.filterd (m0042333.ppops.net [127.0.0.1])
 by mx0b-0014ca01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x1QAmbHV024571; Tue, 26 Feb 2019 03:00:59 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cadence.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=proofpoint;
 bh=DWmVzzRniBlQalGqvuigQMbLt0nLfKSvL5tv5Qdg75g=;
 b=bvsvVwGHs0NyhJoBq0Epv2bjhC402+8CnNyba4aFxKG2J2+EWo2s+x30BS/TNb+BwllB
 qQpn2RBN9FyaU0mcz+g/uG+YC5eZ/NHDsvFAd6PYVSiMKzGibEVvnYmqDBC1f9nZ1URL
 pNw4BHNGrwMG2kN3KTB3HLU7OxAl8SG4cfBmFJrYBUR96SGo091pzsnaOz80aMuvRkzA
 XuUaWgFTtt89mRBiS0NBQik1N+OqjHqwfiUGkVNZfhgjeuEgqApj0hMi2lZXOd4y7NWm
 eiixUs0baLKwEfvHIDeo3cwvnAogvYvjJceqYZ6B+Z5Zk9s1Asjk1BWIz67pwmMkYM6P BQ== 
Authentication-Results: cadence.com;
	spf=pass smtp.mailfrom=pgaj@cadence.com
Received: from nam05-dm3-obe.outbound.protection.outlook.com
 (mail-dm3nam05lp2052.outbound.protection.outlook.com [104.47.49.52])
 by mx0b-0014ca01.pphosted.com with ESMTP id 2qw2yrgacd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 26 Feb 2019 03:00:59 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cadence.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DWmVzzRniBlQalGqvuigQMbLt0nLfKSvL5tv5Qdg75g=;
 b=s2EYCwWKvYWyTr+62yxI6K0qbYC3uuJhWScpKFvrY7kmiYWphTl5oqs8bSRqORNay/mxpQhuknNhIFeAqis1mrE36y1hsgecmT2KbzQ7k1uADeXE84RBj9zOMxTg2do+eUbuGgQnIyLrH9N/NSh6bWJfpNwOD6yI/Ev77oUssNM=
Received: from DM5PR07CA0054.namprd07.prod.outlook.com (2603:10b6:4:ad::19) by
 CY1PR07MB2248.namprd07.prod.outlook.com (2a01:111:e400:5a10::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.1643.18; Tue, 26 Feb
 2019 11:00:57 +0000
Received: from DM3NAM05FT058.eop-nam05.prod.protection.outlook.com
 (2a01:111:f400:7e51::206) by DM5PR07CA0054.outlook.office365.com
 (2603:10b6:4:ad::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.1643.15 via Frontend
 Transport; Tue, 26 Feb 2019 11:00:57 +0000
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 cadence.com discourages use of 199.43.4.28 as permitted sender)
Received: from rmmaillnx1.cadence.com (199.43.4.28) by
 DM3NAM05FT058.mail.protection.outlook.com (10.152.98.174) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1665.5 via Frontend Transport; Tue, 26 Feb 2019 11:00:56 +0000
Received: from maileu3.global.cadence.com (maileu3.cadence.com [10.160.88.99])
 by rmmaillnx1.cadence.com (8.14.4/8.14.4) with ESMTP id
 x1QB0qAl002695
 (version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=OK);
 Tue, 26 Feb 2019 06:00:54 -0500
X-CrossPremisesHeadersFilteredBySendConnector: maileu3.global.cadence.com
Received: from maileu3.global.cadence.com (10.160.88.99) by
 maileu3.global.cadence.com (10.160.88.99) with Microsoft SMTP Server (TLS) id
 15.0.1367.3; Tue, 26 Feb 2019 12:00:51 +0100
Received: from lvlogina.cadence.com (10.165.176.102) by
 maileu3.global.cadence.com (10.160.88.99) with Microsoft SMTP Server (TLS) id
 15.0.1367.3 via Frontend Transport; Tue, 26 Feb 2019 12:00:51 +0100
Received: from lvlogina.cadence.com (localhost.localdomain [127.0.0.1])
 by lvlogina.cadence.com (8.14.4/8.14.4) with ESMTP id x1QB0oLh016881;
 Tue, 26 Feb 2019 11:00:50 GMT
Received: (from pgaj@localhost)
 by lvlogina.cadence.com (8.14.4/8.14.4/Submit) id x1QB0oJB016880;
 Tue, 26 Feb 2019 11:00:50 GMT
From: Przemyslaw Gaj <pgaj@cadence.com>
To: <bbrezillon@kernel.org>
Subject: [PATCH 2/3] i3c: master: cdns: Drop support for I2C 10 bit addresing
 in Cadence I3C master
Date: Tue, 26 Feb 2019 11:00:02 +0000
Message-ID: <20190226110003.5909-3-pgaj@cadence.com>
X-Mailer: git-send-email 2.8.3
In-Reply-To: <20190226110003.5909-1-pgaj@cadence.com>
References: <20190226110003.5909-1-pgaj@cadence.com>
MIME-Version: 1.0
X-OrganizationHeadersPreserved: maileu3.global.cadence.com
X-EOPAttributedMessage: 0
X-Forefront-Antispam-Report: CIP:199.43.4.28; IPV:CAL; SCL:-1; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(136003)(39860400002)(376002)(346002)(396003)(2980300002)(36092001)(199004)(189003)(6916009)(107886003)(426003)(11346002)(446003)(2906002)(126002)(476003)(2616005)(486006)(26826003)(478600001)(87636003)(50466002)(4326008)(48376002)(336012)(5024004)(53936002)(76176011)(316002)(51416003)(16586007)(26005)(42186006)(186003)(47776003)(54906003)(97736004)(69596002)(81156014)(1076003)(2351001)(68736007)(4744005)(106466001)(105596002)(305945005)(356004)(6666004)(86362001)(5660300002)(8936002)(50226002)(81166006)(36756003)(8676002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:CY1PR07MB2248; H:rmmaillnx1.cadence.com; FPR:;
 SPF:SoftFail; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0a9f59e6-b70e-4e75-7021-08d69bd9af33
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600127)(711020)(4605104)(2017052603328)(7153060);
 SRVR:CY1PR07MB2248; 
X-MS-TrafficTypeDiagnostic: CY1PR07MB2248:
X-Microsoft-Exchange-Diagnostics: 1; CY1PR07MB2248;
 20:BFs/L0+l+Z9Gync6Z1jTFQZFN0SBYu+/NAGyW/buw7khYTtkdwLNvOCUY9YAACyZXFtP1gjBySroEyGL1zMWIGcD+tJYVJ2dBsIuusjhmHLevOVqO3nzBhJdV8TZeXdgBxghKzWDgIIsC3pBCLqBLVVpc33yWaD3p5em19R2iZpdzGtZcXRuglNm7ldGDQzMRuLd2fu0WUq7EPtP2GNlba4CLhhZfG463oaK6F3He7BcvCe4XJtLsWJwbmEz1VsCvFYCk0Yfkoa/AhPag4ct5TDVwdABeqBVYq+0z2cJi8OObxH41oqakdENDIEUm+epErfYe9GsAIXjLyuM74WQsMmMxAFeTa6aPJiKM6QSjCEgD/hnujU2ozqrvaIUXml/tBJyoYBjUAhgv2IPibnYuELfrMfC4xGomqNJIpd9INdAUsn00ypKppOtMffQv6ygfjr/5Mb4p8clK2nrmJQnSFpcpVBoF9qLP/Z7/VIOc4hNgFNV5M/gT+RTzw9U7hWv
X-Microsoft-Antispam-PRVS: <CY1PR07MB22485450BF65A74EAD87D397C27B0@CY1PR07MB2248.namprd07.prod.outlook.com>
X-Forefront-PRVS: 096029FF66
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; CY1PR07MB2248;
 23:yu/9VKAimI0dG3v2VMwk/ft0wUYNk7jCYSMiGphpZ?=
 =?us-ascii?Q?6mMkEhZyBq+zXnWIsRiM/JlTTKMUFT8AtlJ8oi1zNcUUOYeQ6cgtuzQjoB0o?=
 =?us-ascii?Q?S/zdkbzHSdzoMI964jzz3NYKLpjetoBYPqCU5euucvw9FrsnNTOf/KYZYQtT?=
 =?us-ascii?Q?xjOmYj+pNt12oGGMp+W6XesPY0K7GjBNqhSk12N6Eq3wyNIm7weqQ5Np0lup?=
 =?us-ascii?Q?Qjs/famz+tbh4lZQ+pjhnGMy/PsX/c8+RNh96H687Wc4lQr5DyfJYcva+GUx?=
 =?us-ascii?Q?QhFMmV3TWJazhvEFoAfeS1LacOv5ekbE4NkvFgPN9C4/9rxDvBQmCHdgUnhs?=
 =?us-ascii?Q?Gb+YTzCqtTDnVKUNCl7OY/HXGngkTIzqqyRpesxRZ0NL+iHCjMNAA0GUpE7P?=
 =?us-ascii?Q?3vN55Pf6guNiDBblLuL2zsrT0QQQssMq9CMnfQXa2EaSq1jpwyIR2ewnRsgz?=
 =?us-ascii?Q?MBqgrjQRltDyu2/9isspN/VZUUoiazVRqwMeRP2YgZEFU9sbrqbf7TVOyr2o?=
 =?us-ascii?Q?TP6t4Q6C67A+mh6d9BP5+G7h/e/5U2pDiCKtkfNHYvkEyAQuW5hQZdomld1l?=
 =?us-ascii?Q?wDhe//WjF6V1iRyVvFJ1iIi6wOOvknGaR1mlvhU0hy6DlHf3AToEI0bQtyTr?=
 =?us-ascii?Q?IwcXeFbFPHSq1A2CI7B0UY6GsHlS36/MxIcN3SW3cpfCdnohO+vWSn/fHZTP?=
 =?us-ascii?Q?covzW4yY4k7VlORs6wz7OYL7p1m3K8haC90Hwxx023ewNMip0kT5zCydqf24?=
 =?us-ascii?Q?Jz2HbJvPznFxRzelWOikneUO3fNDzYSOLTMzRfH3XtDm3QwqEoS8ST7L4+cQ?=
 =?us-ascii?Q?StW3H+U5wjsEI/l+Aszl5+bcx8sS8UYiEQf+wpT9q+F8d2tDM6YFyMLUqSqj?=
 =?us-ascii?Q?7ezdw09/bCZtJpbjUr5Z4JwW6eOhgTeOBPmGNO6EYj76B2extOYaVUhCmxa1?=
 =?us-ascii?Q?EBcnvoE9KqUUlyAaB/q8GQLyxyLGkw/e00Vh3iER7dmGHOR6oDtBQ+W8/JMp?=
 =?us-ascii?Q?gP9zvjDwICtkdQUZfAfV5ZU0VSCYVWqNA2iFR9RrcTGPm0o3Y9BCmT34uhbG?=
 =?us-ascii?Q?OFtRUT0cPPs14zugqcXSfJO0iCYP65GQFKkOJT3zWpQt0ZQT5A6GVH90iv6S?=
 =?us-ascii?Q?TZSoFUnUtwgsjWqxJaFBgzncrNP87e0k9gqJdZ6aa5SI9bq1siWmQSi5YmzV?=
 =?us-ascii?Q?FRCJjeINg7zES2uZMDK+fYNisWXlC3+Y+WwL7o6Wxni6X81SGaB38r5aVu61?=
 =?us-ascii?Q?e0Xz87geyj/yotjoNk=3D?=
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: Z0WRRwS8cBLG6xJXHo/I30AUdhOxhq0xiwdHA1XD+WWY9rncybvczXtEmQjCZv/AcT+9hrtx9sRzhAuk+1lswhrXzIA6gpGdw7zswhcTnDhqbrjHhFcYlhO1Jv6pqy2yTbTsFBcDgiXB3vUQo+XbjVIHRamXrPduaCXKsAKt6PHdey5LjkTGn76PpS+ePLVjxNXm9np1pPC5YWgESI+98Ry6W6sG/K2+QbERIPw2qygyO4yhl5I63ldxCP+9KVXIlLvc8npWb65HNVyZhjlaxE/uf3oVAAAVIW+iQiYV3DvKA+Ap6GUqb2xqovWw8bD5j2Q/5sy+z935q8gLUFmac2EgURwLFIahJtNTpOmoTzeMLEHmUiDIXIQkM/tg4UljmgqYzRKjE2fg7yjU2ivrzHLu5WVVpgqitd+gUteozkk=
X-Microsoft-Exchange-Diagnostics: 1; CY1PR07MB2248;
 20:9j1tMAbAj7R20ML/LGxVj/DrSf+z9yfPlPiK92QaaERVYBQWno9KIUv0GXlCYm9s0jWW6EeNQ0vknMOIrc0Y39VDtAMuk8TJe6WaY2fIsNDk3zLtqNsRwubbqV6NoIZ+BU220Eb6uDqm/fzIgAsDqBF4sDQsp2jpZwYgEoODXrcCOizT/zkLUPurgV308BWwh7YHzBWPBocAxauy6K3XAuy7Xg9NATZQ/Mvf+JlwEUFMlDadxTc0CD/8jFK/ms47
X-OriginatorOrg: cadence.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2019 11:00:56.6294 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0a9f59e6-b70e-4e75-7021-08d69bd9af33
X-MS-Exchange-CrossTenant-Id: d36035c5-6ce6-4662-a3dc-e762e61ae4c9
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=d36035c5-6ce6-4662-a3dc-e762e61ae4c9; Ip=[199.43.4.28];
 Helo=[rmmaillnx1.cadence.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY1PR07MB2248
X-Proofpoint-SPF-Result: pass
X-Proofpoint-SPF-Record: v=spf1 include:_spf.salesforce.com
 include:mktomail.com
 include:spf-0014ca01.pphosted.com include:spf.protection.outlook.com
 include:auth.msgapp.com include:spf.mandrillapp.com ~all
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-02-26_07:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_check_notspam policy=outbound_check
 score=0
 priorityscore=1501 malwarescore=0 suspectscore=3 phishscore=0 bulkscore=0
 spamscore=0 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=681 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1902260082
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190226_030101_412541_5DEE41C7 
X-CRM114-Status: GOOD (  10.83  )
X-BeenThere: linux-i3c@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: Linux I3C <linux-i3c.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-i3c>,
 <mailto:linux-i3c-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-i3c/>
List-Post: <mailto:linux-i3c@lists.infradead.org>
List-Help: <mailto:linux-i3c-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-i3c>,
 <mailto:linux-i3c-request@lists.infradead.org?subject=subscribe>
Cc: linux-i3c@lists.infradead.org, Przemyslaw Gaj <pgaj@cadence.com>,
 rafalc@cadence.com, vitor.soares@synopsys.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org

Because this patch series dropped support for 10 bit I2C devices, support is
also dropped in Cadence I3C master driver.

Signed-off-by: Przemyslaw Gaj <pgaj@cadence.com>
---
 drivers/i3c/master/i3c-master-cdns.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/i3c/master/i3c-master-cdns.c b/drivers/i3c/master/i3c-master-cdns.c
index 8889a4f..1797fbf 100644
--- a/drivers/i3c/master/i3c-master-cdns.c
+++ b/drivers/i3c/master/i3c-master-cdns.c
@@ -1010,9 +1010,7 @@ static int cdns_i3c_master_attach_i2c_dev(struct i2c_dev_desc *dev)
 	master->free_rr_slots &= ~BIT(slot);
 	i2c_dev_set_master_data(dev, data);
 
-	writel(prepare_rr0_dev_address(dev->boardinfo->base.addr) |
-	       (dev->boardinfo->base.flags & I2C_CLIENT_TEN ?
-		DEV_ID_RR0_LVR_EXT_ADDR : 0),
+	writel(prepare_rr0_dev_address(dev->boardinfo->base.addr),
 	       master->regs + DEV_ID_RR0(data->id));
 	writel(dev->boardinfo->lvr, master->regs + DEV_ID_RR2(data->id));
 	writel(readl(master->regs + DEVS_CTRL) |
-- 
2.8.3


_______________________________________________
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
