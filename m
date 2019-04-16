Return-Path: <SRS0=s+0C=SS=lists.infradead.org=linux-i3c-bounces+linux-i3c=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56801C282DD
	for <linux-i3c@archiver.kernel.org>; Tue, 16 Apr 2019 04:42:19 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 21E2D2075B
	for <linux-i3c@archiver.kernel.org>; Tue, 16 Apr 2019 04:42:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="RcPe5bnx";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=cadence.com header.i=@cadence.com header.b="HU/NxjLX";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=cadence.com header.i=@cadence.com header.b="GMNyQG94"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 21E2D2075B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=cadence.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Fqss1VYpb5AaEBNZVNF0xBnatUFTKW6s9bZBWsaXbM4=; b=RcPe5bnxJ49FJu
	p5GRssVdK37fUNT4E5+qPiA23r2jSyiCcxc5CQUvFzHcgV4S+DKFHjFJwPoq6g7xjuAAEC4C4sCSZ
	0/b3SOtrrC8auck1Fzo1HFShOY/2Z4LV8Ky8FzoFPVA+b610wACZsi+07bInjLUCeCRA/LeoRX6x4
	roNnwLPdv1eJ8gytlxuPdDNR+opA/X3Wdb24ghrOBsKDr1PeSgzu+BvB5MRpDo9HfnASU758avWkR
	/1iGs0Xd5tB3Apaf0z4SzimryW6ICSIn6npG/IjZY5gs3yEaX0YP5z4zGE45RBDKF2h0QQ82vcFWk
	KQGUNRzdGgeC3f9RjN3w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hGFvG-00087h-QD; Tue, 16 Apr 2019 04:42:18 +0000
Received: from mx0a-0014ca01.pphosted.com ([208.84.65.235])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hGFvB-00085o-IR
 for linux-i3c@lists.infradead.org; Tue, 16 Apr 2019 04:42:16 +0000
Received: from pps.filterd (m0042385.ppops.net [127.0.0.1])
 by mx0a-0014ca01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x3G4bMTP016548; Mon, 15 Apr 2019 21:42:05 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cadence.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-type; s=proofpoint;
 bh=qYU4+fMnIVb8kCbsgUbN6N+FC54rSusKWPQVAr0f05A=;
 b=HU/NxjLXl4TMv8sbUK9Vuw9K4Smj5yGZTrzUy6GRSKFui2gA/KgusnomtBv6qWPeW7Q6
 sRDZ1WuxwytN9cDrOlgO0vuV0abO5XhPxPNe9vbe64igsc8yhrLZECyTf3R8l0gWYDE9
 kWBGQxxHs4QGTst0fnUEMf9yT2Y+OV8tmIYNRHOdCZIiEni3l9NcLajbMHIjyiDV/iTA
 SkrHXMbN8B300frTZfLlEOOe9yXH+3lGSKeSvj5OP17e9u0j/6xYmGzyd+AvwuCAHNLm
 jfFnjQdXuS0/AS+W8JauJOrjln7deMNw4TUcnPag1vtZ3PB31F2ivYEwEQq+5RUCrHCy Fw== 
Authentication-Results: cadence.com;
	spf=pass smtp.mailfrom=pgaj@cadence.com
Received: from nam02-cy1-obe.outbound.protection.outlook.com
 (mail-cys01nam02lp2052.outbound.protection.outlook.com [104.47.37.52])
 by mx0a-0014ca01.pphosted.com with ESMTP id 2rw74gr93n-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT);
 Mon, 15 Apr 2019 21:42:04 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cadence.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qYU4+fMnIVb8kCbsgUbN6N+FC54rSusKWPQVAr0f05A=;
 b=GMNyQG94VaAlfhNZS5+FG/SKXJZOCj3mv9NFMAf8AT079M8btoBSbQKX+AWImv3oEpRdV/VG+w2f1aiWb4h6K5jqKQZb3n8zlyIZOgH3f8mmB7+vd0pPeyQ4qo504YHycrvliMhe5cDO4GrGYDw9WhrHlKScb8IVQA4bxzNitUg=
Received: from CO2PR07CA0057.namprd07.prod.outlook.com (2603:10b6:100::25) by
 MN2PR07MB6816.namprd07.prod.outlook.com (2603:10b6:208:11d::27) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.1792.17; Tue, 16 Apr
 2019 04:42:01 +0000
Received: from CO1NAM05FT018.eop-nam05.prod.protection.outlook.com
 (2a01:111:f400:7e50::204) by CO2PR07CA0057.outlook.office365.com
 (2603:10b6:100::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.1792.15 via Frontend
 Transport; Tue, 16 Apr 2019 04:42:01 +0000
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 cadence.com discourages use of 199.43.4.28 as permitted sender)
Received: from rmmaillnx1.cadence.com (199.43.4.28) by
 CO1NAM05FT018.mail.protection.outlook.com (10.152.96.125) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.1792.7 via Frontend Transport; Tue, 16 Apr 2019 04:42:00 +0000
Received: from maileu3.global.cadence.com (maileu3.cadence.com [10.160.88.99])
 by rmmaillnx1.cadence.com (8.14.4/8.14.4) with ESMTP id
 x3G4fuQR002971
 (version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=OK);
 Tue, 16 Apr 2019 00:41:58 -0400
X-CrossPremisesHeadersFilteredBySendConnector: maileu3.global.cadence.com
Received: from maileu3.global.cadence.com (10.160.88.99) by
 maileu3.global.cadence.com (10.160.88.99) with Microsoft SMTP Server (TLS) id
 15.0.1367.3; Tue, 16 Apr 2019 06:41:56 +0200
Received: from lvlogina.cadence.com (10.165.176.102) by
 maileu3.global.cadence.com (10.160.88.99) with Microsoft SMTP Server (TLS) id
 15.0.1367.3 via Frontend Transport; Tue, 16 Apr 2019 06:41:56 +0200
Received: from lvlogina.cadence.com (localhost.localdomain [127.0.0.1])
 by lvlogina.cadence.com (8.14.4/8.14.4) with ESMTP id x3G4ftUH003530;
 Tue, 16 Apr 2019 05:41:55 +0100
Received: (from pgaj@localhost)
 by lvlogina.cadence.com (8.14.4/8.14.4/Submit) id x3G4fsuJ003403;
 Tue, 16 Apr 2019 05:41:54 +0100
From: Przemyslaw Gaj <pgaj@cadence.com>
To: <bbrezillon@kernel.org>
Subject: [PATCH v4 0/4] Drop support for I2C 10 bit devices from I3C subsystem
Date: Tue, 16 Apr 2019 05:41:42 +0100
Message-ID: <20190416044146.2382-1-pgaj@cadence.com>
X-Mailer: git-send-email 2.8.3
MIME-Version: 1.0
X-OrganizationHeadersPreserved: maileu3.global.cadence.com
X-EOPAttributedMessage: 0
X-Forefront-Antispam-Report: CIP:199.43.4.28; IPV:CAL; SCL:-1; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(376002)(136003)(346002)(396003)(39860400002)(2980300002)(189003)(199004)(54534003)(36092001)(107886003)(8936002)(4326008)(356004)(6916009)(106466001)(81166006)(8676002)(68736007)(2351001)(69596002)(2906002)(81156014)(105596002)(50226002)(76130400001)(4744005)(36756003)(53936002)(6666004)(5660300002)(54906003)(316002)(1076003)(16586007)(42186006)(50466002)(87636003)(97736004)(48376002)(478600001)(126002)(26826003)(336012)(426003)(305945005)(86362001)(186003)(486006)(14444005)(476003)(47776003)(2616005)(26005)(51416003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR07MB6816; H:rmmaillnx1.cadence.com; FPR:;
 SPF:SoftFail; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8d65af00-d031-4377-510e-08d6c225ddb7
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600140)(711020)(4605104)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328);
 SRVR:MN2PR07MB6816; 
X-MS-TrafficTypeDiagnostic: MN2PR07MB6816:
X-Microsoft-Antispam-PRVS: <MN2PR07MB68162F1B2BBD0320E5208C32C2240@MN2PR07MB6816.namprd07.prod.outlook.com>
X-Forefront-PRVS: 000947967F
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: BSQuQQhuIQC59BOC1rdtKXJhr7JWil+cxVwyx9RkHAPmkNG8/cpakdS6MAFqIXdfr+UNfnw3Y5UIWfpYbOaib9fnop5ZMKGlFpRRHVHiYw0osYjPEc0XqTjxWu3wLBAck3uSLB+KFi08VJkmDLUPEId0X1kEGSt3Y1kOpGuRpc/U/isLLRzBT8nc3LlnVz78tI1EDtZt3rBPDveu6XFST7bKor3ocKDwVnJa7Oajy+aNPMOplj0mLLCJC6QA5sKf2CAZejZ730b95Qms6F/zE3uEr/8Ts/UkFOsPCtagXKPN5S5qaj9Dxt3Soes9cJXrPtSBJzlH6oRAHBGa8dlEiimPZLjOPpYQmurjFuUey9K058RGnmhEW854m3zHtE6ciaBI0SWAHJnmG9lRjD69EvZUPbsu9U8sLGzngu6ppa0=
X-OriginatorOrg: cadence.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Apr 2019 04:42:00.5928 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8d65af00-d031-4377-510e-08d6c225ddb7
X-MS-Exchange-CrossTenant-Id: d36035c5-6ce6-4662-a3dc-e762e61ae4c9
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=d36035c5-6ce6-4662-a3dc-e762e61ae4c9; Ip=[199.43.4.28];
 Helo=[rmmaillnx1.cadence.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR07MB6816
X-Proofpoint-SPF-Result: pass
X-Proofpoint-SPF-Record: v=spf1 include:spf.smktg.jp
 include:_spf.salesforce.com
 include:mktomail.com include:spf-0014ca01.pphosted.com
 include:spf.protection.outlook.com include:auth.msgapp.com
 include:spf.mandrillapp.com ~all
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-04-16_02:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_check_notspam policy=outbound_check
 score=0
 priorityscore=1501 malwarescore=0 suspectscore=1 phishscore=0 bulkscore=0
 spamscore=0 clxscore=1011 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=881 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1904160033
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190415_214213_717408_60A96FB7 
X-CRM114-Status: UNSURE (   7.66  )
X-CRM114-Notice: Please train this message.
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
Cc: linux-i3c@lists.infradead.org, agolec@cadence.com,
 Przemyslaw Gaj <pgaj@cadence.com>, rafalc@cadence.com,
 vitor.soares@synopsys.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org

I3C MIPI spec does not clearly say that I2C 10bit devices are supported.
Additionally, it isn't possible to pass 10 bit device properly through DEFSLVS
command and reserve address for such device on secondary master side.

Main changes between v3 and v4:
- Fix changelogs
- Fix patch versioning
- Change order of the patches to make it bisectable.

Przemyslaw Gaj (4):
  i3c: master: cdns: Drop support for I2C 10 bit addresing in Cadence
    I3C master
  i3c: master: dw-i3c-master: Remove i2c_funcs hook implementation
  i3c: Drop support for I2C 10 bit addresing
  dt-bindings: i3c: Document dropped support for I2C 10 bit devices

 Documentation/devicetree/bindings/i3c/i3c.txt |  4 +++-
 drivers/i3c/master.c                          | 21 ++++++++++++++-------
 drivers/i3c/master/dw-i3c-master.c            |  6 ------
 drivers/i3c/master/i3c-master-cdns.c          | 10 +---------
 include/linux/i3c/master.h                    |  5 +----
 5 files changed, 19 insertions(+), 27 deletions(-)

-- 
2.8.3


_______________________________________________
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
