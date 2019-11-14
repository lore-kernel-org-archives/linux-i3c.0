Return-Path: <SRS0=SSUK=ZG=lists.infradead.org=linux-i3c-bounces+linux-i3c=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B54A4C432C3
	for <linux-i3c@archiver.kernel.org>; Thu, 14 Nov 2019 05:52:34 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9A8E620723
	for <linux-i3c@archiver.kernel.org>; Thu, 14 Nov 2019 05:52:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="lLG/Wd71";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=cadence.com header.i=@cadence.com header.b="erVyKKAF";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=cadence.com header.i=@cadence.com header.b="2Z8wZqKz"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9A8E620723
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=cadence.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=SHsdWaKE4vv02MQfnTMsrUsDNfpoE9X9FiBaZCPdMDI=; b=lLG/Wd71xr9tMF
	4esTihIfoVXYfCHLaQjA1zXk2v9meLZJ5O+6f4gxEXZFJJPDFSdNa5P+nYdL4I7nlU3Wwd2GA/fvU
	Ok2S8zZ94o+vn4KhKX2x1dBfZQPgShuE6jH9637XE3bFrzRBR8hJaD2nbkK8qbCs2PUkZHKor88sL
	lOKljUUZV2DZzm6xpFlWvy2B1a27+yoemUF9VAshWIeidKz+yHbwCZE7coHXfk8gsGS7g33cU5iK3
	1R8aaGdZAYGhpBeqlzMY2qPU7n9WnHtpFjF3MNgHBjMdvMCdc+9g2eriFpOq2edQi8j9CAgQd1d4w
	sGt32Yj5IPp63A26uudQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iV83W-0000AM-3Z; Thu, 14 Nov 2019 05:52:34 +0000
Received: from mx0a-0014ca01.pphosted.com ([208.84.65.235])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iV83S-00009K-MX
 for linux-i3c@lists.infradead.org; Thu, 14 Nov 2019 05:52:33 +0000
Received: from pps.filterd (m0042385.ppops.net [127.0.0.1])
 by mx0a-0014ca01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 xAE5klL3032198; Wed, 13 Nov 2019 21:52:27 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cadence.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-type; s=proofpoint;
 bh=a9Qeb4xLH/LgQF/v/iOEjiumnZgIT0i0KD3EgLiVf3w=;
 b=erVyKKAFDzz5sI5ovgT67dshHeCP/iLmF12b6kThRqS13cDb5D6oea6CqXWx/O025tVM
 hYTSDnIsHTP0hjm2oceetf2j69hjdEhAIW3iUMJWzVLyPB2h4ZlwhTlBO3sJPrKlYICs
 dKJRqykMXTWDInx3oE1ILCpn/uCuOmKootO6gVTqmQC/QAZZVS24+PNVn5xxOWh1bTJm
 zSp4Ovq8SV1D8e35y9K+sZc9nglU5AXrbzlM16O9aaVuCZ9iGAJMPX7CgCI/LDoaR0GP
 mCCLth+jznptC/pULhp5tNpqGHCBy0rwEi50eA88A8xD5jEXO+XeVReitCPgYAqWTMtR FA== 
Received: from nam05-dm3-obe.outbound.protection.outlook.com
 (mail-dm3nam05lp2055.outbound.protection.outlook.com [104.47.49.55])
 by mx0a-0014ca01.pphosted.com with ESMTP id 2w7prt0v9p-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 13 Nov 2019 21:52:27 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XoaLYYrHu5r4pr9T3DqUmEKbCRYLifyRWJDutrJhKioo0YGNLLuod84EdZ1mDzKX3M2s9TJe+lPQdj5XF4KAeYDnbHnu6UGTtDWdbivPglNsLwVUP/JrYvSBch8HDjW3e7nNlElPGhYq9ZCSomjVSq9HyYR+ISWHd9iemZZperB5QEn0e+NEC2/OiHeFmpVxUaH8dSmPPsRn5nwhX6ioxHSEXzsoAwwdOMy0ZYC4sNgLDZHbGfmF23KA6INcFT/RzTvAlU2ovysRzTF5U/Fg6MloNbtMnjrXUhvAZ4oWznWoNFw0kl/hyML7ieni7KvWTP1bSS3y6tR+agmSTja67w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=a9Qeb4xLH/LgQF/v/iOEjiumnZgIT0i0KD3EgLiVf3w=;
 b=KQaPAPDLBQxrajMzP2UmPl+rCJSTYcuRTonaHU1wKTNLdQlA7kXSlLY/SW1BpwPb8u3/UvVB+FSZm0wG7inDyYX0eBllYO5uhUWpaZsRxHbIL3+AjHFmm5IUTSPwyh4HIkPGxlijnYguNGX8xsJjSX8/KS6eXbMT9CwSLnj2V2xyoHOyNDGLi9IpB4GrPqz7wm01ZNGFbR4bafxL/jRypL5dlrLmcqwSLgc9I/fru3EZf1Agt3mAYrEP+ctdafawIZzRydhhjBG5h7kBmfqawIJELXSA1VMiSDWIDrHN0PgjE5e5wMqknMfJ6q7Uz4hmnV/gltfLnpIIo+JqO7RMVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 199.43.4.28) smtp.rcpttodomain=kernel.org smtp.mailfrom=cadence.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=cadence.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cadence.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=a9Qeb4xLH/LgQF/v/iOEjiumnZgIT0i0KD3EgLiVf3w=;
 b=2Z8wZqKzTlDivolPy+Hwzpx49qW25o3RG2Rgr+2GMXULlwrSk4TXzylf4Z39XkFnFuoGV/rd0r+AQRI0iOShmnAjlBaqK1MIZBvCqqU5ubsgBWVyRuRLUHHIJrzHErg1lx/217Awnis2+QcLev1AY2WISTRh+iNTmB2nRKSfaTI=
Received: from CY1PR07CA0039.namprd07.prod.outlook.com
 (2a01:111:e400:c60a::49) by DM6PR07MB4988.namprd07.prod.outlook.com
 (2603:10b6:5:2d::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2430.24; Thu, 14 Nov
 2019 05:52:25 +0000
Received: from CO1NAM05FT061.eop-nam05.prod.protection.outlook.com
 (2a01:111:f400:7e50::206) by CY1PR07CA0039.outlook.office365.com
 (2a01:111:e400:c60a::49) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2451.22 via Frontend
 Transport; Thu, 14 Nov 2019 05:52:25 +0000
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 cadence.com discourages use of 199.43.4.28 as permitted sender)
Received: from rmmaillnx1.cadence.com (199.43.4.28) by
 CO1NAM05FT061.mail.protection.outlook.com (10.152.96.179) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2451.15 via Frontend Transport; Thu, 14 Nov 2019 05:52:24 +0000
Received: from maileu3.global.cadence.com (maileu3.cadence.com [10.160.88.99])
 by rmmaillnx1.cadence.com (8.14.4/8.14.4) with ESMTP id
 xAE5qKn4030933
 (version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=OK);
 Thu, 14 Nov 2019 00:52:21 -0500
X-CrossPremisesHeadersFilteredBySendConnector: maileu3.global.cadence.com
Received: from maileu3.global.cadence.com (10.160.88.99) by
 maileu3.global.cadence.com (10.160.88.99) with Microsoft SMTP Server (TLS) id
 15.0.1367.3; Thu, 14 Nov 2019 06:52:19 +0100
Received: from vleu-orange.cadence.com (10.160.88.83) by
 maileu3.global.cadence.com (10.160.88.99) with Microsoft SMTP Server (TLS) id
 15.0.1367.3 via Frontend Transport; Thu, 14 Nov 2019 06:52:19 +0100
Received: from vleu-orange.cadence.com (localhost.localdomain [127.0.0.1])
 by vleu-orange.cadence.com (8.14.4/8.14.4) with ESMTP id xAE5qJd7020515;
 Thu, 14 Nov 2019 06:52:19 +0100
Received: (from pgaj@localhost)
 by vleu-orange.cadence.com (8.14.4/8.14.4/Submit) id xAE5qJxb020514;
 Thu, 14 Nov 2019 06:52:19 +0100
From: Przemyslaw Gaj <pgaj@cadence.com>
To: <bbrezillon@kernel.org>
Subject: [PATCH 0/3] Add data hold delay support
Date: Thu, 14 Nov 2019 06:51:52 +0100
Message-ID: <20191114055155.20446-1-pgaj@cadence.com>
X-Mailer: git-send-email 2.14.0
MIME-Version: 1.0
X-OrganizationHeadersPreserved: maileu3.global.cadence.com
X-EOPAttributedMessage: 0
X-Forefront-Antispam-Report: CIP:199.43.4.28; IPV:CAL; SCL:-1; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(376002)(346002)(39860400002)(136003)(36092001)(189003)(199004)(47776003)(356004)(87636003)(486006)(36756003)(5660300002)(6666004)(2616005)(107886003)(48376002)(4744005)(50466002)(126002)(476003)(14444005)(26005)(4326008)(336012)(76130400001)(86362001)(1076003)(186003)(478600001)(26826003)(42186006)(50226002)(54906003)(16586007)(8936002)(316002)(8676002)(70206006)(2351001)(6916009)(426003)(51416003)(81166006)(70586007)(81156014)(305945005)(2906002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM6PR07MB4988; H:rmmaillnx1.cadence.com; FPR:;
 SPF:SoftFail; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d2f94c1e-e7c6-47d8-e093-08d768c6d2d5
X-MS-TrafficTypeDiagnostic: DM6PR07MB4988:
X-Microsoft-Antispam-PRVS: <DM6PR07MB4988538E48ECE5C547F1BD33C2710@DM6PR07MB4988.namprd07.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-Forefront-PRVS: 02213C82F8
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: GUCALUPGlhtJxRZ8Oveo+OF06LSYuWsGMB8Ldk7zFAWQ1lb6MyvN1ZEny5lN0yzSik04WKV2ZLmC/jdfXNx3RQBzLuYq7TyA6rNY3HyzTsJKYvLD5YxBJ6Wv4hgBDn6KIVV5yfUaLFMJInLqUlpaCZliYheILdEXYGTkDpddBoQGS9eYDe6A5TN2nKkh+Q/ETgycEtryhj5/5iSww0pWPu8UurpjXLJpXyEvsiK9mnEsY3HSz2X/t1bat8IA8mtc5L60FU0bis0AkUAoUOMKFz4Z1+mSiJ8cufdOjdfGMCK4MWATm1JDfON5XN791F/Ci1DRlmoyba1J3C+hbLC4hsZGsAy3GpNYWLjvljwwiXSoVKSa+To7zt7eZRqXkR9iNuHqn5f30GvwS9S3RiAYTaKFWckoXnbvXJIe9TeUvyl78+CfisUuVNvEWTk76jMgMlTUkcAEkEaFvEdapWczjg==
X-OriginatorOrg: cadence.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2019 05:52:24.4774 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d2f94c1e-e7c6-47d8-e093-08d768c6d2d5
X-MS-Exchange-CrossTenant-Id: d36035c5-6ce6-4662-a3dc-e762e61ae4c9
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=d36035c5-6ce6-4662-a3dc-e762e61ae4c9; Ip=[199.43.4.28];
 Helo=[rmmaillnx1.cadence.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR07MB4988
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,18.0.572
 definitions=2019-11-13_06:2019-11-13,2019-11-13 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_check_notspam policy=outbound_check
 score=0 adultscore=0
 spamscore=0 clxscore=1015 impostorscore=0 mlxscore=0 lowpriorityscore=0
 malwarescore=0 priorityscore=1501 bulkscore=0 suspectscore=1
 mlxlogscore=768 phishscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-1910280000 definitions=main-1911140055
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191113_215231_742827_70BDC29C 
X-CRM114-Status: UNSURE (   7.49  )
X-CRM114-Notice: Please train this message.
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

Add THD_DEL (Data Hold Delay) support. After testing different scenarios,
on various systems, sometimes there is a need to delay SDA_OUT propagation.

Adding support which allows to configure that delay using the device
tree parameter.

Przemyslaw Gaj (3):
  i3c: master: add data hold delay support
  dt-bindings: i3c: Document data hold delay feature
  MAINTAINERS: add myself as maintainer of Cadence I3C master controller
    driver

 Documentation/devicetree/bindings/i3c/cdns,i3c-master.txt | 6 ++++++
 MAINTAINERS                                               | 6 ++++++
 drivers/i3c/master/i3c-master-cdns.c                      | 5 ++++-
 3 files changed, 16 insertions(+), 1 deletion(-)

-- 
2.14.0


_______________________________________________
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
