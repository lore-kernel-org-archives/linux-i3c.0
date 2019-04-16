Return-Path: <SRS0=s+0C=SS=lists.infradead.org=linux-i3c-bounces+linux-i3c=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97041C10F13
	for <linux-i3c@archiver.kernel.org>; Tue, 16 Apr 2019 08:36:43 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 64C512073F
	for <linux-i3c@archiver.kernel.org>; Tue, 16 Apr 2019 08:36:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="husaoOQt";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=cadence.com header.i=@cadence.com header.b="NNOzjSKk";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=cadence.com header.i=@cadence.com header.b="IOr5T/1+"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 64C512073F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=cadence.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=AySyHUFwFsTJiNxAnZHicuiyEmYZz/9qMTfUsKVNBEA=; b=husaoOQta1L4K2
	cNY8TIQVt8fvAffetRWimMTfSHuR4AiZivQV226HSrpnrn56K+RVhwpjI+Gys2U8dChBqPHCTmOVH
	Gl8J8mSTyudoLTAv3zhwyBsqVOFhWxbndU+axWtawV+XbU2RnSptlhgfDmhv8JGKOzVsmiOc6wcO2
	tyZ8IkqBdSMkdKwqe4lwChEawHEQpUptPFyrLAcAgtW3p8gJR1JyMonlkKVvzFaLU4QRF8cW/Bmq2
	M3LFKjZdtaoEDTCdxTaMh7AUdDkjryl9a/oVRP7R8z0PQmGwZC525e/8RBhUGurhHfE/1689PVSA5
	gHaNUpTLrVTwfR/XcJug==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hGJa6-0002rF-I8; Tue, 16 Apr 2019 08:36:42 +0000
Received: from mx0b-0014ca01.pphosted.com ([208.86.201.193]
 helo=mx0a-0014ca01.pphosted.com)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hGJZx-0002ge-Lj
 for linux-i3c@lists.infradead.org; Tue, 16 Apr 2019 08:36:36 +0000
Received: from pps.filterd (m0042333.ppops.net [127.0.0.1])
 by mx0b-0014ca01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x3G8TMPc028353; Tue, 16 Apr 2019 01:36:28 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cadence.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-type; s=proofpoint;
 bh=S//l5zrjkApZwsDkNLFogtRDHQAsZHpFtB8te/O2aLs=;
 b=NNOzjSKko/yxPNyzudL9RmMYg4fAdWOIXeKWtMPibPIVYoxoqBsxj3D20QkmdNdnuxRD
 TG8AeSHSYH4eZooO51H637ib9+FVD0/TgQ2vzEEiS0km82VI7pic9gxq4AQOZOwic0ZD
 7dbYtroCoX6TuvP/SCkQWwF+frRBj9CU/bzPVtWWh1GsgsKudydhTt+2f0UxLwoI3iBU
 Y9AYfO97aPfFMDeDNgoxieow/FXfOF2JRmiNsHcnGOh06S1Tjezao1H+OzBHxYG5T8p7
 bPoQuxZ2rsB/srMfjcySQmLw7zC32x5w73j34k7HOSABJVfhUUS2Hl4Z91RU4WM09XWt qg== 
Authentication-Results: cadence.com;
	spf=pass smtp.mailfrom=pgaj@cadence.com
Received: from nam03-dm3-obe.outbound.protection.outlook.com
 (mail-dm3nam03lp2059.outbound.protection.outlook.com [104.47.41.59])
 by mx0b-0014ca01.pphosted.com with ESMTP id 2rw7d9h1jy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 16 Apr 2019 01:36:27 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cadence.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=S//l5zrjkApZwsDkNLFogtRDHQAsZHpFtB8te/O2aLs=;
 b=IOr5T/1+A2Bpu8qcDDZGC9XByJfNXMCv3xfFRq7c5UOWqQGrHK5z0v6+HimYTaUD82+Q8aWBSpLIt7Svt3473gJfLJ1kx+c2pEsjMbGUJKIqXiG7ycHB17bNXs+WAXmPWg2Cml2G5jdJBvmopHuDcTuqk/9Xg94hBB7p1bgRCbQ=
Received: from DM5PR07CA0076.namprd07.prod.outlook.com (2603:10b6:4:ad::41) by
 BYAPR07MB5814.namprd07.prod.outlook.com (2603:10b6:a03:12d::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.1792.15; Tue, 16 Apr
 2019 08:36:25 +0000
Received: from CO1NAM05FT003.eop-nam05.prod.protection.outlook.com
 (2a01:111:f400:7e50::200) by DM5PR07CA0076.outlook.office365.com
 (2603:10b6:4:ad::41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.1792.15 via Frontend
 Transport; Tue, 16 Apr 2019 08:36:25 +0000
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 cadence.com discourages use of 158.140.1.28 as permitted sender)
Received: from sjmaillnx1.cadence.com (158.140.1.28) by
 CO1NAM05FT003.mail.protection.outlook.com (10.152.96.108) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.1792.7 via Frontend Transport; Tue, 16 Apr 2019 08:36:24 +0000
Received: from maileu3.global.cadence.com (maileu3.cadence.com [10.160.88.99])
 by sjmaillnx1.cadence.com (8.14.4/8.14.4) with ESMTP id
 x3G8aKGf020581
 (version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=OK);
 Tue, 16 Apr 2019 01:36:23 -0700
X-CrossPremisesHeadersFilteredBySendConnector: maileu3.global.cadence.com
Received: from maileu3.global.cadence.com (10.160.88.99) by
 maileu3.global.cadence.com (10.160.88.99) with Microsoft SMTP Server (TLS) id
 15.0.1367.3; Tue, 16 Apr 2019 10:36:20 +0200
Received: from lvlogina.cadence.com (10.165.176.102) by
 maileu3.global.cadence.com (10.160.88.99) with Microsoft SMTP Server (TLS) id
 15.0.1367.3 via Frontend Transport; Tue, 16 Apr 2019 10:36:20 +0200
Received: from lvlogina.cadence.com (localhost.localdomain [127.0.0.1])
 by lvlogina.cadence.com (8.14.4/8.14.4) with ESMTP id x3G8aJc7011081;
 Tue, 16 Apr 2019 09:36:19 +0100
Received: (from pgaj@localhost)
 by lvlogina.cadence.com (8.14.4/8.14.4/Submit) id x3G8aIkh011066;
 Tue, 16 Apr 2019 09:36:18 +0100
From: Przemyslaw Gaj <pgaj@cadence.com>
To: <bbrezillon@kernel.org>
Subject: [PATCH v6 0/2] Drop support for I2C 10 bit devices from I3C subsystem
Date: Tue, 16 Apr 2019 09:36:13 +0100
Message-ID: <20190416083615.6894-1-pgaj@cadence.com>
X-Mailer: git-send-email 2.8.3
MIME-Version: 1.0
X-OrganizationHeadersPreserved: maileu3.global.cadence.com
X-EOPAttributedMessage: 0
X-Forefront-Antispam-Report: CIP:158.140.1.28; IPV:CAL; SCL:-1; CTRY:US;
 EFV:NLI; SFV:NSPM;
 SFS:(10009020)(136003)(346002)(39860400002)(396003)(376002)(2980300002)(54534003)(199004)(189003)(36092001)(106466001)(426003)(50466002)(2351001)(48376002)(8676002)(86362001)(50226002)(5660300002)(76130400001)(105596002)(126002)(476003)(2616005)(4326008)(14444005)(486006)(336012)(246002)(8936002)(47776003)(26005)(51416003)(16586007)(42186006)(4744005)(186003)(107886003)(305945005)(87636003)(7636002)(6916009)(36756003)(2906002)(26826003)(478600001)(54906003)(6666004)(356004)(316002)(1076003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BYAPR07MB5814; H:sjmaillnx1.cadence.com; FPR:;
 SPF:SoftFail; LANG:en; PTR:corp.cadence.com; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c522b67f-f6e8-4fe9-1b70-08d6c2469c8f
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600140)(711020)(4605104)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328);
 SRVR:BYAPR07MB5814; 
X-MS-TrafficTypeDiagnostic: BYAPR07MB5814:
X-Microsoft-Antispam-PRVS: <BYAPR07MB5814B547CD481FB9CDB68125C2240@BYAPR07MB5814.namprd07.prod.outlook.com>
X-Forefront-PRVS: 000947967F
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: C1uwiDELqsQj0Nf4Cv1AdDWTYkwkuC/wzKxPPRSZlXlWBDL8ePpAMlvYMPOFH1go8oE10hOepojoeUHjPi2mTuJHXDruEYtncIFv6LCOT2SXP9Xm5WOSVMgsY/uYEG01khCSxXLeGd1lr/gasVrY5EskQewvqEgINW2K8uaV3hu8jeTAy+jszvHYG6w6vuNFEFjAr4vFi95ARGxObtQM5TD+3vAWKn8EfJYJLu1eAIgW6IuPXpKw0dyfhKU4Rk4zamhkq0gX1KCFEu3+6MZM3pEPVS8PLPP39Fj2NlyR6F8YLIvUS42D6EdhBqS664aRhUzjYC65+OCxjbC43zO7Ebg/JAOg9V78Lu3RDxSLJ0LkBRWLssf3TdFml6UL3pktny/kO37LUbKZJndgc+aUMdQb2gagk+bWgA4P8Bvhtic=
X-OriginatorOrg: cadence.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Apr 2019 08:36:24.8185 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c522b67f-f6e8-4fe9-1b70-08d6c2469c8f
X-MS-Exchange-CrossTenant-Id: d36035c5-6ce6-4662-a3dc-e762e61ae4c9
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=d36035c5-6ce6-4662-a3dc-e762e61ae4c9; Ip=[158.140.1.28];
 Helo=[sjmaillnx1.cadence.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR07MB5814
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
 spamscore=0 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1904160060
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190416_013634_647838_4A1C05FB 
X-CRM114-Status: UNSURE (   8.80  )
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

Main changes between v5 and v6:
- Fix typo in commit message

Main changes between v4 and v5:
- Merge HC driver patches and I3C subsystem into one.

Main changes between v3 and v4:
- Fix changelogs
- Fix patch versioning
- Change order of the patches to make it bisectable.

Przemyslaw Gaj (2):
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
