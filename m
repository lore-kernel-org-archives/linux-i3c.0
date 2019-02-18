Return-Path: <SRS0=nyfO=QZ=lists.infradead.org=linux-i3c-bounces+linux-i3c=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.1 required=3.0 tests=BAD_ENC_HEADER,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4BD2CC43381
	for <linux-i3c@archiver.kernel.org>; Mon, 18 Feb 2019 13:13:11 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 19DEB217F9
	for <linux-i3c@archiver.kernel.org>; Mon, 18 Feb 2019 13:13:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="aKmwb+Pe";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=cadence.com header.i=@cadence.com header.b="edoAulgM";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=cadence.com header.i=@cadence.com header.b="p/8Wn6yF"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 19DEB217F9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=cadence.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=IsnpdqkldiclJuY4njeAvLuDwSj/xyTyp2WEHTbbG+M=; b=aKmwb+Pe3Se5Jb
	Wesox/ODUoLUFq6zNRschESUnDp5xpHuYlBK/SqAgGNU3jtyILHiwhqOip6AvQNzKZSg5+upEbEw5
	aqe+WeRfazQFRPME5gh5YincH/aClKm0zNSTRAWfrTZzmzeKzFpUZ4FYUSQJ1HgL5Dyix/4/k4BaF
	mOjEPJH9nmpIwiJIaUDttLf1Ao0jxqFIDVZoSzAuqNLYa7zygzKQ5F57UI0Z0QRilv65K8GJP603p
	T1CXBRgo+xOKfqYB7uCVHlTDAibqa4zHW3DWBQdQX3BxKty72irWcIdU5GBP0ovawTyy3ACfzGLJI
	mkd4h7vJg5oelihaH07A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gvijO-0001a3-Ni; Mon, 18 Feb 2019 13:13:10 +0000
Received: from mx0a-0014ca01.pphosted.com ([208.84.65.235])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gvijL-0001YL-9e
 for linux-i3c@lists.infradead.org; Mon, 18 Feb 2019 13:13:09 +0000
Received: from pps.filterd (m0042385.ppops.net [127.0.0.1])
 by mx0a-0014ca01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x1ID7GWP011026; Mon, 18 Feb 2019 05:13:02 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cadence.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-type; s=proofpoint;
 bh=4LywumgBpfQ2XU3vXE1cy4cUwi2u5s6gN3bb0h8ewcQ=;
 b=edoAulgM925jDyp81w7n1g66adzTGXSFN6Imz3ceB3mR+Xz3XEFsE7oBKuSOyVaF0p5e
 9l92H08kGZ5X7TTjagWxEugDdtOuGqv13EMYFvtmDi0lphw5TinbJIfnW++807CBLqU3
 P4ieptu+vyRMV0hNYyCQvGnWp8dXDx4/fzhjP8uz0E+/bZYhhwHa0EjbjrIcFM8PgwJe
 hpYSS2uPAkQZCvSLH5+xWSlPHLkwu94Dj69KMr+B06ZXTZIHleQRt45dKK4x83U94Yef
 mBMyDHvALyegMkfelZjTMySBM4iEtrW83QRlYoHilXJfBo5TLp9nu0YD21PvN6o7ZBWL Aw== 
Authentication-Results: cadence.com;
	spf=pass smtp.mailfrom=pgaj@cadence.com
Received: from nam02-sn1-obe.outbound.protection.outlook.com
 (mail-sn1nam02lp2059.outbound.protection.outlook.com [104.47.36.59])
 by mx0a-0014ca01.pphosted.com with ESMTP id 2qqt6q0mr5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT);
 Mon, 18 Feb 2019 05:13:01 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cadence.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4LywumgBpfQ2XU3vXE1cy4cUwi2u5s6gN3bb0h8ewcQ=;
 b=p/8Wn6yFJLjsMT3DGBgYp9gx0yra6kg40UT+qvDwQTM8ZefPwQexQTQVne/gDW2f0dj+TE2GpRQ1uBADZ1yg2YE8RNjBNjnMZEa1gWFJb0O3QUVkdF2EC0uJhQ854WFSAIT8Rg0D/mQhPadbD0fgiBfuPi9Wdw59kd9mVqPeLN4=
Received: from BN8PR07CA0009.namprd07.prod.outlook.com (2603:10b6:408:ac::22)
 by MWHPR07MB3104.namprd07.prod.outlook.com (2603:10b6:300:de::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.1622.16; Mon, 18 Feb
 2019 13:12:59 +0000
Received: from BY2NAM05FT041.eop-nam05.prod.protection.outlook.com
 (2a01:111:f400:7e52::205) by BN8PR07CA0009.outlook.office365.com
 (2603:10b6:408:ac::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.1622.16 via Frontend
 Transport; Mon, 18 Feb 2019 13:12:58 +0000
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 cadence.com discourages use of 158.140.1.28 as permitted sender)
Received: from sjmaillnx1.cadence.com (158.140.1.28) by
 BY2NAM05FT041.mail.protection.outlook.com (10.152.100.178) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1643.11 via Frontend Transport; Mon, 18 Feb 2019 13:12:58 +0000
Received: from maileu3.global.cadence.com (maileu3.cadence.com [10.160.88.99])
 by sjmaillnx1.cadence.com (8.14.4/8.14.4) with ESMTP id
 x1IDCuZ5019867
 (version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=OK);
 Mon, 18 Feb 2019 05:12:57 -0800
X-CrossPremisesHeadersFilteredBySendConnector: maileu3.global.cadence.com
Received: from maileu3.global.cadence.com (10.160.88.99) by
 maileu3.global.cadence.com (10.160.88.99) with Microsoft SMTP Server (TLS) id
 15.0.1367.3; Mon, 18 Feb 2019 14:12:49 +0100
Received: from lvlogina.cadence.com (10.165.176.102) by
 maileu3.global.cadence.com (10.160.88.99) with Microsoft SMTP Server (TLS) id
 15.0.1367.3 via Frontend Transport; Mon, 18 Feb 2019 14:12:49 +0100
Received: from lvlogina.cadence.com (localhost.localdomain [127.0.0.1])
 by lvlogina.cadence.com (8.14.4/8.14.4) with ESMTP id x1IDCnhe000823;
 Mon, 18 Feb 2019 13:12:49 GMT
Received: (from pgaj@localhost)
 by lvlogina.cadence.com (8.14.4/8.14.4/Submit) id x1IDCmTZ000759;
 Mon, 18 Feb 2019 13:12:48 GMT
From: Przemyslaw Gaj <pgaj@cadence.com>
To: <bbrezillon@kernel.org>
Subject: [PATCH 0/4] Add the I3C mastership request
Date: Mon, 18 Feb 2019 13:08:42 +0000
Message-ID: <20190218130846.19939-1-pgaj@cadence.com>
X-Mailer: git-send-email 2.8.3
MIME-Version: 1.0
X-OrganizationHeadersPreserved: maileu3.global.cadence.com
X-EOPAttributedMessage: 0
X-Forefront-Antispam-Report: CIP:158.140.1.28; IPV:CAL; SCL:-1; CTRY:US;
 EFV:NLI; SFV:NSPM;
 SFS:(10009020)(376002)(346002)(396003)(136003)(39860400002)(2980300002)(36092001)(189003)(199004)(426003)(87636003)(4326008)(8936002)(26826003)(47776003)(478600001)(6916009)(126002)(36756003)(48376002)(86362001)(51416003)(107886003)(50466002)(476003)(186003)(8676002)(356004)(42186006)(54906003)(2906002)(316002)(106466001)(26005)(6666004)(16586007)(5660300002)(7636002)(305945005)(246002)(14444005)(486006)(1076003)(105596002)(2616005)(336012)(50226002)(2351001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MWHPR07MB3104; H:sjmaillnx1.cadence.com; FPR:;
 SPF:SoftFail; LANG:en; PTR:corp.cadence.com; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 47eb08c9-a9ca-417b-6187-08d695a2cd72
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600110)(711020)(4605104)(2017052603328)(7153060);
 SRVR:MWHPR07MB3104; 
X-MS-TrafficTypeDiagnostic: MWHPR07MB3104:
X-Microsoft-Exchange-Diagnostics: 1; MWHPR07MB3104;
 20:D1+RbhyqeAVbjLr7wxM03L3NRVTPym1xPI/ka2aH0WBv4ODmV1AawDmesjeS7hf7aVn17B0UhMBFRTGzMUFjVvlMbiWPc2htQ9+lJeEYkt7duIS/rjYjkgAp4U6yZv0Fn7kFYgIQ3ZwrB+IAD4MjLK9yDKA3W6h34myDDe9vOWhR5GH9vQjTeAU9K/r6pPIr1cWMQ1yPFQ74lOhAMiV/CQtA/WnLpHRmWNI0iavNimIFiDCJMLxXkdhzNWlOe33Cmcvs76Cp8mgJevug7b90sF80eau/9LY3Fym6KNwPz4/hltaVN4C3izFA3QpdYIY33u66xNiJxPAygAJDGoEwWBJ2WjolC+NhQFAdzsXR397Snfrat0gxF1O7oIqgqmVwOykP2NAlF1ORsWKxIxP+0Hpr7ZFU2jplviXupzxGF5rxi4M/OPpcEV/VYRJltFmTNoXjL18RO9IXFTYUOt0eur5/tuyeQJiisLkV5iaHEccnKSRZTmcnnFI9PNeRFy1W
X-Microsoft-Antispam-PRVS: <MWHPR07MB310464F42E656606A512B9DFC2630@MWHPR07MB3104.namprd07.prod.outlook.com>
X-Forefront-PRVS: 09525C61DB
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; MWHPR07MB3104;
 23:ArLro3aNsD4O+h0n1wUttoSDLI7SdFSbr978iGkPq?=
 =?us-ascii?Q?g/ycEcusps4PkLSWa4SuXnBHc/wxHZFNUGpE2O/kk8ivLyvkY9Vf+LzBq62V?=
 =?us-ascii?Q?wWSt6PXAR+Kmk70uDGqqx+4P20cPDAyYr+izF/B6Cbr7Ondk4q1tSlysw1+6?=
 =?us-ascii?Q?BvD/dRfum9RNT827ZxRsLG8p08u7dN5Z7iqYe99/QiDaq0DvQcKrQNhtn1SM?=
 =?us-ascii?Q?UCigxS0qnRVH2lh+xULVfUDhlLBG46st7vZSysh9Eeq6JNWGNPJ17clsWBDK?=
 =?us-ascii?Q?LKsCmq8KypUtG1QVXtTFHhn2IjFOObDTDF3ktsAPOaYpI1bG5qeN6lQi90FC?=
 =?us-ascii?Q?7DyjU/Sk51uWNkQN4CIM4+zmtmb9uJClGwz92KwapGd+31MkPlC3tMQUd8d1?=
 =?us-ascii?Q?A0NYoeWHx8dPxruQBvxVdFEABBxI5ELl2I8OnDuANs/n0UcxsTPFFMxAVgiI?=
 =?us-ascii?Q?vt32dzUS2+/+CvIK2/bwVbI4OSIc4pX+cv37Q1urfyY9sx1VbOr0wJn87fD9?=
 =?us-ascii?Q?JvxpS8rMThTc2bEo8qRWrTsUzaQp+Dw71od62vQWRG9/6BsQAuH+bm0RBzPl?=
 =?us-ascii?Q?uUCCZMtQ5O/Ix15+P2Z8d5+96/g3548LgJV+65XbdAiB3CyuIqbTUX9ZVCCe?=
 =?us-ascii?Q?ECkgQB5Ej8BIxnWh5B1NGNyVGKZBVXMd258c96Z5Ce2NzUv4yVql1C/s3tbx?=
 =?us-ascii?Q?Fns50LE9z3HNhxHhLpg4bxUxgtfjhiEH3L5/Z7vAZic0qggVpBAXdMHNOfCc?=
 =?us-ascii?Q?lCKoKybfQJruTJMsG7AfrSx1t0ksCgDf5WcIB/RZ+G27XQxvAcpMhTHFnKX7?=
 =?us-ascii?Q?K8Z40jsQ4UJEPbeDmhwNxtjf0zkS2ZbWto01mIew6X6jaw6l3hT3bBrtoV5N?=
 =?us-ascii?Q?WqaWcbqZ0Dp75UCq2YwoWGVewh4bJr9c+lqcRofI6u9CywWHZQZcUb277Pds?=
 =?us-ascii?Q?0d6IM15+ppfyOO8BApiJQc3I4d7oYY5wXWHR+XYDKcEe8vfq83Au8elEb4rK?=
 =?us-ascii?Q?MBOv9RsqrItlgOU/7oXxEBh6IwBie8qltrcRdMjMx4hiJHk6wCocAby6G/RG?=
 =?us-ascii?Q?BfvYSuxyY0wr7XEN1B6o5zEh1F2?=
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: jy+fF2szM9tCsgmcHu+dd34ZsZD4yadCAoNKmWIXS4I6I5fBnjjlKQPMguBCXtcE6NpDGTtmxH7ZJE34Pf0JFyHq7yGUppfGadWMiEhalqWHS4Krm5oOAJM6QymCfSyxq6H/kV1sUjoabHtP+2XW8tFhQahB3Efgl4C2E2EUE0YqymFHd/6iEFoH/C0i8ZDm/d0czJEY+Y1OzeXwpkPmMZlz6k2ABAbjMhNW3bk9a8BLbl0NgBRHGtQOmywjk+5gqDFNXi8u+FKYIGIOgAwyH2ecVtdwW9ffIEdd8g02FFbmiRWuzN3nLvT3xT94Kn1WECJBa7CswQEj3wcMJ7p+a2leN6spILL0kY8NEfQi4i9goEFFXGyE9liQMKaVPZaTyDkS4Cwo4q275nmLSG3Q8ENNUlZZpp27eubXHKBozoQ=
X-Microsoft-Exchange-Diagnostics: 1; MWHPR07MB3104;
 20:7GyLlVDcHcWUtSKWzlUSgBqZX563KOnydjAJRzwHyDbOA3yIH4uV1dXmNDNpHn155I7yBvzkeCDmTed10DDVf+etcDsdpZBwIK4Nl4hjM7i/ioh6UsfFulbEx7zINwP/oPtsyh+71OgJeoU1jpwu8dTBNutu1Iq1Z4hKl6ggjtqmoqIofzHyqlXsp0YR2DqzBxWm6va+4X3roKROT0wl6QLlEjdf0Q8TgPFvTysMvDr1bCW/ay2OJHrkfcrD8lDD
X-OriginatorOrg: cadence.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Feb 2019 13:12:58.2929 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 47eb08c9-a9ca-417b-6187-08d695a2cd72
X-MS-Exchange-CrossTenant-Id: d36035c5-6ce6-4662-a3dc-e762e61ae4c9
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=d36035c5-6ce6-4662-a3dc-e762e61ae4c9; Ip=[158.140.1.28];
 Helo=[sjmaillnx1.cadence.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR07MB3104
X-Proofpoint-SPF-Result: pass
X-Proofpoint-SPF-Record: v=spf1 include:_spf.salesforce.com
 include:mktomail.com
 include:spf-0014ca01.pphosted.com include:spf.protection.outlook.com
 include:auth.msgapp.com include:spf.mandrillapp.com ~all
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-02-18_10:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_check_notspam policy=outbound_check
 score=0
 priorityscore=1501 malwarescore=0 suspectscore=1 phishscore=0 bulkscore=0
 spamscore=0 clxscore=1011 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=957 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1902180099
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190218_051307_717368_D69D2A8F 
X-CRM114-Status: UNSURE (   8.82  )
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
Cc: linux-i3c@lists.infradead.org, Przemyslaw Gaj <pgaj@cadence.com>,
 rafalc@cadence.com, vitor.soares@synopsys.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org

This patch series adds support for mastership request to I3C
subsystem and Cadence I3C master driver. Mastership request
allows slave to become the master of the I3C bus.

Main changes between v2 and v3 are:
- Added DEFSLVS devices are registered from master driver
- Reworked I2C registering on secondary master side
- Reworked Mastership event is enabled/disabled globally

Main changes between initial version and v2 are:
- Reworked devices registration on secondary master side
- Reworked mastership event disabling/enabling
- Reworked bus locking during mastership takeover process
- Added DEFSLVS devices registration during initialization
- Fixed style issues

Przemyslaw Gaj (4):
  i3c: Add support for mastership request to I3C subsystem
  i3c: master: cdns: add support for mastership request to Cadence I3C
    master driver.
  i3c: master: Add module author
  MAINTAINERS: add myself as co-maintainer of I3C subsystem

 MAINTAINERS                          |   1 +
 drivers/i3c/device.c                 |  47 ++++
 drivers/i3c/internals.h              |   4 +
 drivers/i3c/master.c                 | 430 ++++++++++++++++++++++++------
 drivers/i3c/master/i3c-master-cdns.c | 493 +++++++++++++++++++++++++++++++----
 include/linux/i3c/master.h           |  22 ++
 6 files changed, 872 insertions(+), 125 deletions(-)

-- 
2.8.3


_______________________________________________
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
