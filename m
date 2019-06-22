Return-Path: <SRS0=3/jM=UV=lists.infradead.org=linux-i3c-bounces+linux-i3c=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC7DDC43613
	for <linux-i3c@archiver.kernel.org>; Sat, 22 Jun 2019 20:56:05 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BE5F220657
	for <linux-i3c@archiver.kernel.org>; Sat, 22 Jun 2019 20:56:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="vD4vIyUN";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=cadence.com header.i=@cadence.com header.b="nBr5zQRf";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=cadence.com header.i=@cadence.com header.b="dzzIe69Z"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BE5F220657
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=cadence.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=G1eCkD/OpdTVeOHca04deTmn+G56AWHsopbc0XJDRgo=; b=vD4vIyUNah8cqz
	v74IgK3h7WVHJBOsVAs42Ko7sRiNvlfP59/gf6UXHJx2BdWc5cAEvRv8HZbcdbY3USRMKP28Pht7n
	FJ30ni/cgEBTDSvTZEHPDpYIRqanv4yvPcdkRwhaStGZ3kA0kZf1XuUwSh7pr7KRAZOQ1zUeOjJ0A
	YmJauv758+h/PstI4fAMn4rR6Jh3mh/Z/1M4GO9oF/6oOS939QY3/eUgMR1XYr+sycRR3fXRKfx9P
	sCwOfrpRkTOuDXL9Q3l3JyExS5WLQ9RkiLcJyB9zmNuzkte0ShTkp8BaAZXgyJfi08F5o9VAErLe5
	YpXruHxMx3dgHy6l2clg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hen3N-0007AF-Fx; Sat, 22 Jun 2019 20:56:05 +0000
Received: from mx0a-0014ca01.pphosted.com ([208.84.65.235])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hen3J-00079O-QM
 for linux-i3c@lists.infradead.org; Sat, 22 Jun 2019 20:56:03 +0000
Received: from pps.filterd (m0042385.ppops.net [127.0.0.1])
 by mx0a-0014ca01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x5MKqD4p030002; Sat, 22 Jun 2019 13:56:00 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cadence.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=proofpoint;
 bh=A462SMESzxUgM7fnbYwQr1TMTxNtlz8TKBsfWaXmXKQ=;
 b=nBr5zQRfKfCp1OoFDy3p2dHvJMc9IAcohqaOmiUo7Twgzk1qGzQiGMVRldvrGoxBSdFd
 MKMKFHmktcLHTXIUipDsGI7mMD9OG4qoOzWEkhGjDZ/RXTA99W0/igGlMZfrFD+a4U4y
 UnlzTf8aFY9BE8OydJ2hjjgPxvQTvvE82DiZNaaCBHl/0hc5UGqypVo7nOT0j7Ub6jvB
 CKHLUWSnTc5e9tdl3y3t8ASY1QFTAXxPL2rei/3h5GQ3VYH0HW9XJkjpU+E+2UJV/PJ3
 js2zCq+PUCvyv5jm66K7g6do2RVdCrFQII+K39MFZ7tb23D54Yh/zrvoqSstaRW6UGyg Jw== 
Authentication-Results: cadence.com;
	spf=pass smtp.mailfrom=pgaj@cadence.com
Received: from nam03-by2-obe.outbound.protection.outlook.com
 (mail-by2nam03lp2053.outbound.protection.outlook.com [104.47.42.53])
 by mx0a-0014ca01.pphosted.com with ESMTP id 2t9gvs1ce7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 22 Jun 2019 13:56:00 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cadence.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=A462SMESzxUgM7fnbYwQr1TMTxNtlz8TKBsfWaXmXKQ=;
 b=dzzIe69Z1f0cZywzdnJ+n688/lAzIv1fHX5srNWPWhPnEQ4Wtk9YZ/YqjBGmiVJHZ1g2OGtuofvyjvrcJGRFBhjSvYrA7JwGOHxQWgRF5IBmMCZ+f6bCLRxzibZGCbIo4XFpHT8qAqYvolrEU8d2LO3BHw/2eQIz0JJ/RZAdZZ4=
Received: from MN2PR07CA0002.namprd07.prod.outlook.com (2603:10b6:208:1a0::12)
 by BN8PR07MB6817.namprd07.prod.outlook.com (2603:10b6:408:b9::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.1987.13; Sat, 22 Jun
 2019 20:55:57 +0000
Received: from BY2NAM05FT018.eop-nam05.prod.protection.outlook.com
 (2a01:111:f400:7e52::201) by MN2PR07CA0002.outlook.office365.com
 (2603:10b6:208:1a0::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2008.16 via Frontend
 Transport; Sat, 22 Jun 2019 20:55:57 +0000
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 cadence.com discourages use of 199.43.4.28 as permitted sender)
Received: from rmmaillnx1.cadence.com (199.43.4.28) by
 BY2NAM05FT018.mail.protection.outlook.com (10.152.100.155) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2032.6 via Frontend Transport; Sat, 22 Jun 2019 20:55:56 +0000
Received: from maileu3.global.cadence.com (maileu3.cadence.com [10.160.88.99])
 by rmmaillnx1.cadence.com (8.14.4/8.14.4) with ESMTP id
 x5MKtrFM029128
 (version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=OK);
 Sat, 22 Jun 2019 16:55:54 -0400
X-CrossPremisesHeadersFilteredBySendConnector: maileu3.global.cadence.com
Received: from maileu3.global.cadence.com (10.160.88.99) by
 maileu3.global.cadence.com (10.160.88.99) with Microsoft SMTP Server (TLS) id
 15.0.1367.3; Sat, 22 Jun 2019 22:55:53 +0200
Received: from lvlogina.cadence.com (10.165.176.102) by
 maileu3.global.cadence.com (10.160.88.99) with Microsoft SMTP Server (TLS) id
 15.0.1367.3 via Frontend Transport; Sat, 22 Jun 2019 22:55:53 +0200
Received: from lvlogina.cadence.com (localhost.localdomain [127.0.0.1])
 by lvlogina.cadence.com (8.14.4/8.14.4) with ESMTP id x5MKtqSH009860;
 Sat, 22 Jun 2019 21:55:52 +0100
Received: (from pgaj@localhost)
 by lvlogina.cadence.com (8.14.4/8.14.4/Submit) id x5MKtqRm009859;
 Sat, 22 Jun 2019 21:55:52 +0100
From: Przemyslaw Gaj <pgaj@cadence.com>
To: <bbrezillon@kernel.org>
Subject: [PATCH v5 3/7] i3c: export i3c_bus_set_mode function
Date: Sat, 22 Jun 2019 21:55:01 +0100
Message-ID: <1561236905-8901-4-git-send-email-pgaj@cadence.com>
X-Mailer: git-send-email 2.4.5
In-Reply-To: <1561236905-8901-1-git-send-email-pgaj@cadence.com>
References: <1561236905-8901-1-git-send-email-pgaj@cadence.com>
MIME-Version: 1.0
X-OrganizationHeadersPreserved: maileu3.global.cadence.com
X-EOPAttributedMessage: 0
X-Forefront-Antispam-Report: CIP:199.43.4.28; IPV:CAL; SCL:-1; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(979002)(39860400002)(396003)(136003)(346002)(376002)(2980300002)(199004)(189003)(36092001)(426003)(486006)(336012)(478600001)(26005)(68736007)(446003)(316002)(76176011)(69596002)(126002)(16586007)(51416003)(81166006)(26826003)(2616005)(8936002)(5660300002)(4326008)(107886003)(476003)(36756003)(186003)(8676002)(81156014)(356004)(53936002)(70206006)(86362001)(2351001)(50226002)(76130400001)(47776003)(6916009)(5024004)(87636003)(2906002)(14444005)(42186006)(305945005)(50466002)(6666004)(11346002)(48376002)(54906003)(70586007)(969003)(989001)(999001)(1009001)(1019001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN8PR07MB6817; H:rmmaillnx1.cadence.com; FPR:;
 SPF:SoftFail; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b2d5c8ea-36d1-459e-d516-08d6f7540604
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328);
 SRVR:BN8PR07MB6817; 
X-MS-TrafficTypeDiagnostic: BN8PR07MB6817:
X-Microsoft-Antispam-PRVS: <BN8PR07MB68171DFED7456379998260B4C2E60@BN8PR07MB6817.namprd07.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-Forefront-PRVS: 0076F48C8A
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: e9z7tTs3js6QfURcLXNQwaXT85Ok5c8SoaaiasmCbaIFyVxZgOPdPwedubTTjK5fs/GfL3MiAvMTPhVd9UBaznE+MT0R9ZdGTbRxnRG+TSglBuXkHDMVNgDLvgrexB5b/sEaB7ISf3jcNnMceyK7IBxl8+r6O31cSDLyyBTzf/rl/ozRTLsg0yU4g5RdauLcD3l0gqwkk7uJ5OOJ9cq6USTnyqp50Q+igouU2i2zOGPEUkf89vcW8xGKoY9yIdY0Cj3bPy6FwngxGDAzp0TL16uNurHo8u1NE9Uwf3MSqsSK5YkIY3IBcb0fzjSk22ynGiUhoAsvJZJcHRa5G/wLBtIERf99ZdTdDDwS+yGCI5YHWnIiAmU58+ey/+/fX+nGMlDRZ0uUTykl78a0Y4J4cwsz20dFiUDkl3xuIoY3LBk=
X-OriginatorOrg: cadence.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jun 2019 20:55:56.7185 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b2d5c8ea-36d1-459e-d516-08d6f7540604
X-MS-Exchange-CrossTenant-Id: d36035c5-6ce6-4662-a3dc-e762e61ae4c9
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=d36035c5-6ce6-4662-a3dc-e762e61ae4c9; Ip=[199.43.4.28];
 Helo=[rmmaillnx1.cadence.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR07MB6817
X-Proofpoint-SPF-Result: pass
X-Proofpoint-SPF-Record: v=spf1 include:spf.smktg.jp
 include:_spf.salesforce.com
 include:mktomail.com include:spf-0014ca01.pphosted.com
 include:spf.protection.outlook.com include:auth.msgapp.com
 include:spf.mandrillapp.com ~all
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-06-22_14:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_check_notspam policy=outbound_check
 score=0
 priorityscore=1501 malwarescore=0 suspectscore=1 phishscore=0 bulkscore=0
 spamscore=0 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=960 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1906220190
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190622_135601_980425_F8671C43 
X-CRM114-Status: GOOD (  11.23  )
X-BeenThere: linux-i3c@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux I3C <linux-i3c.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-i3c>,
 <mailto:linux-i3c-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-i3c/>
List-Post: <mailto:linux-i3c@lists.infradead.org>
List-Help: <mailto:linux-i3c-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-i3c>,
 <mailto:linux-i3c-request@lists.infradead.org?subject=subscribe>
Cc: linux-i3c@lists.infradead.org, agolec@cadence.com,
 Przemyslaw Gaj <pgaj@cadence.com>, rafalc@cadence.com,
 vitor.soares@synopsys.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org

I need to export this function to let secondary master update the bus mode.
Some newly added I2C devices may operate in slower mode.

Signed-off-by: Przemyslaw Gaj <pgaj@cadence.com>
---
 drivers/i3c/master.c       | 10 ++++++++++
 include/linux/i3c/master.h |  1 +
 2 files changed, 11 insertions(+)

diff --git a/drivers/i3c/master.c b/drivers/i3c/master.c
index 759078f..cbace14 100644
--- a/drivers/i3c/master.c
+++ b/drivers/i3c/master.c
@@ -566,6 +566,15 @@ static const struct device_type i3c_masterdev_type = {
 	.groups	= i3c_masterdev_groups,
 };
 
+/**
+ * i3c_bus_set_mode() - set a bus mode
+ * @i3cbus: I3C bus object
+ * @mode: new bus mode
+ *
+ * This is called at initialization time and should be called when
+ * bus mode has changed, for example when secondary master registered
+ * devices after successful masership takeover.
+ */
 int i3c_bus_set_mode(struct i3c_bus *i3cbus, enum i3c_bus_mode mode)
 {
 	i3cbus->mode = mode;
@@ -590,6 +599,7 @@ int i3c_bus_set_mode(struct i3c_bus *i3cbus, enum i3c_bus_mode mode)
 
 	return 0;
 }
+EXPORT_SYMBOL_GPL(i3c_bus_set_mode);
 
 static struct i3c_master_controller *
 i2c_adapter_to_i3c_master(struct i2c_adapter *adap)
diff --git a/include/linux/i3c/master.h b/include/linux/i3c/master.h
index df3d769..e089771 100644
--- a/include/linux/i3c/master.h
+++ b/include/linux/i3c/master.h
@@ -538,6 +538,7 @@ void i3c_master_cleanup(struct i3c_master_controller *master);
 int i3c_master_register(struct i3c_master_controller *master,
 			struct i3c_device_info *info);
 int i3c_master_unregister(struct i3c_master_controller *master);
+int i3c_bus_set_mode(struct i3c_bus *i3cbus, enum i3c_bus_mode mode);
 
 /**
  * i3c_dev_get_master_data() - get master private data attached to an I3C
-- 
2.4.5


_______________________________________________
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
