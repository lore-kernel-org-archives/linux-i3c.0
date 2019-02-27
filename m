Return-Path: <SRS0=zb1T=RC=lists.infradead.org=linux-i3c-bounces+linux-i3c=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.0 required=3.0 tests=BAD_ENC_HEADER,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17229C00319
	for <linux-i3c@archiver.kernel.org>; Wed, 27 Feb 2019 18:38:14 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DB50D2186A
	for <linux-i3c@archiver.kernel.org>; Wed, 27 Feb 2019 18:38:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="nkBvXoa9";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=cadence.com header.i=@cadence.com header.b="dBC8bdKk";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=cadence.com header.i=@cadence.com header.b="KFkhkPCZ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DB50D2186A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=cadence.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=5WpksmTKpgky5OGjUg/XuaHtwNFZuREiraNhBVQll6Y=; b=nkBvXoa90PBNjB
	OBTfmOhW7FXPqaV1ncsoqaOh95vZRUgVerusKxDgkc5kFj573otJO9qbL5q0DVicv6hyTQvSIp837
	86TJewkD9sBonoLtwtuOAKhuFHzBurjIZbeArK1H02smVMdCMAT2QtV+X2UxUcx8TXMtEzLJj/43C
	XswRSJoEuU4E/kR+DiWqSEdLwqqwHLmOTZdiD8XAImsd0fjGkO85wOTNMsPF+ufWmKos4EpThoS5u
	rfqxjSzXZAOZl9H+kItsHIyvCfbc6s/FYO9Fw+M4gogawaMqATq1Ykx7PG1zIEfBIi0wy2Zosic7X
	Z/POUny9K6yhPHT4U2Yw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gz45t-0006Kd-AP; Wed, 27 Feb 2019 18:38:13 +0000
Received: from mx0a-0014ca01.pphosted.com ([208.84.65.235])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gz45p-0006KD-Eh
 for linux-i3c@lists.infradead.org; Wed, 27 Feb 2019 18:38:11 +0000
Received: from pps.filterd (m0042385.ppops.net [127.0.0.1])
 by mx0a-0014ca01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x1RISYM3032296; Wed, 27 Feb 2019 10:38:03 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cadence.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-type; s=proofpoint;
 bh=/b/ZgTne22O/XtEY/UfQbl0pQ0qwzT4IxRB0oAn5gdw=;
 b=dBC8bdKkrMKn7LlQRD04YAvm22LMrErI0KZLbT0VwVjtrjK66CQYOEmClEJ19zpu8Qv8
 uWgseMocfvZmqtvYiUmojSh2mz0qgKRqFrx+6IvVFRPZ6ltAXyN0v60Na3e4B5E+OjJh
 FWVoO/RR67v2SUbqPCjK8dbTF5/drk7bnuZEoojEHX3GuxhdhIhIQkZ/cg/PeQFfuaBy
 0D4AS9LTwZ/l6NW7S8i3+wSiMAezUTPyRULwXoEtIUk6HLYctYnyeCz9uBWQMYlxnmMO
 6Q+UWfNQbTFOIIry+lqBT7hn055rZ7YMJdgDDkKI+7UohIegMFNfcpRqyE6VQxRpZ87L HQ== 
Authentication-Results: cadence.com;
	spf=pass smtp.mailfrom=pgaj@cadence.com
Received: from nam03-dm3-obe.outbound.protection.outlook.com
 (mail-dm3nam03lp2052.outbound.protection.outlook.com [104.47.41.52])
 by mx0a-0014ca01.pphosted.com with ESMTP id 2qw9jq5t9v-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT);
 Wed, 27 Feb 2019 10:38:02 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cadence.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/b/ZgTne22O/XtEY/UfQbl0pQ0qwzT4IxRB0oAn5gdw=;
 b=KFkhkPCZF4+QveFJn8uPHlrJS45/wC0CvqDIIJ/7iNWIokQYvOygHOFOe2XAQXrlhJAu+MXuJ7B/ypt2qBOmuOTTLhkNSh5B+/LCGmDJQ1+AvJCcvmLDkJFjwps5Gd+6+md+3vND6VOsJr/NBrYaCAqhrK/jsG0qj/OaPVHtVAY=
Received: from DM6PR07CA0012.namprd07.prod.outlook.com (2603:10b6:5:94::25) by
 DM3PR07MB2250.namprd07.prod.outlook.com (2a01:111:e400:c460::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.1643.15; Wed, 27 Feb
 2019 18:38:00 +0000
Received: from CO1NAM05FT032.eop-nam05.prod.protection.outlook.com
 (2a01:111:f400:7e50::203) by DM6PR07CA0012.outlook.office365.com
 (2603:10b6:5:94::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.1665.15 via Frontend
 Transport; Wed, 27 Feb 2019 18:38:00 +0000
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 cadence.com discourages use of 158.140.1.28 as permitted sender)
Received: from sjmaillnx2.cadence.com (158.140.1.28) by
 CO1NAM05FT032.mail.protection.outlook.com (10.152.96.144) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.1686.5 via Frontend Transport; Wed, 27 Feb 2019 18:38:00 +0000
Received: from maileu3.global.cadence.com (maileu3.cadence.com [10.160.88.99])
 by sjmaillnx2.cadence.com (8.14.4/8.14.4) with ESMTP id
 x1RIbvNo013722
 (version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=OK);
 Wed, 27 Feb 2019 10:37:59 -0800
X-CrossPremisesHeadersFilteredBySendConnector: maileu3.global.cadence.com
Received: from maileu3.global.cadence.com (10.160.88.99) by
 maileu3.global.cadence.com (10.160.88.99) with Microsoft SMTP Server (TLS) id
 15.0.1367.3; Wed, 27 Feb 2019 19:37:56 +0100
Received: from lvlogina.cadence.com (10.165.176.102) by
 maileu3.global.cadence.com (10.160.88.99) with Microsoft SMTP Server (TLS) id
 15.0.1367.3 via Frontend Transport; Wed, 27 Feb 2019 19:37:56 +0100
Received: from lvlogina.cadence.com (localhost.localdomain [127.0.0.1])
 by lvlogina.cadence.com (8.14.4/8.14.4) with ESMTP id x1RIbuv7015986;
 Wed, 27 Feb 2019 18:37:56 GMT
Received: (from pgaj@localhost)
 by lvlogina.cadence.com (8.14.4/8.14.4/Submit) id x1RIbtuv015968;
 Wed, 27 Feb 2019 18:37:55 GMT
From: Przemyslaw Gaj <pgaj@cadence.com>
To: <bbrezillon@kernel.org>
Subject: [PATCH v3 0/4] Drop support for I2C 10 bit devices from I3C subsystem
Date: Wed, 27 Feb 2019 18:37:46 +0000
Message-ID: <20190227183750.15367-1-pgaj@cadence.com>
X-Mailer: git-send-email 2.8.3
MIME-Version: 1.0
X-OrganizationHeadersPreserved: maileu3.global.cadence.com
X-EOPAttributedMessage: 0
X-Forefront-Antispam-Report: CIP:158.140.1.28; IPV:CAL; SCL:-1; CTRY:US;
 EFV:NLI; SFV:NSPM;
 SFS:(10009020)(396003)(376002)(39860400002)(346002)(136003)(2980300002)(199004)(189003)(36092001)(36756003)(42186006)(86362001)(1076003)(87636003)(26826003)(316002)(4744005)(51416003)(50466002)(47776003)(6666004)(356004)(48376002)(54906003)(4326008)(305945005)(16586007)(2906002)(107886003)(2351001)(50226002)(5660300002)(486006)(6916009)(476003)(126002)(478600001)(8676002)(246002)(186003)(26005)(426003)(2616005)(336012)(106466001)(7636002)(8936002)(105596002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM3PR07MB2250; H:sjmaillnx2.cadence.com; FPR:;
 SPF:SoftFail; LANG:en; PTR:corp.cadence.com; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 12cece6e-1123-4516-2a8c-08d69ce2b339
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600127)(711020)(4605104)(2017052603328)(7153060);
 SRVR:DM3PR07MB2250; 
X-MS-TrafficTypeDiagnostic: DM3PR07MB2250:
X-Microsoft-Exchange-Diagnostics: 1; DM3PR07MB2250;
 20:6hsBa20ffhB2xLhA9o4kXWokX4z0xOKqi2tlHSk1W5JhHTrMcCRdjABUErfqvudGsCQxYbhdI9PGsToOFQ6B4XCIobPXBkegL8kbrUBdESLWX/b+OkTZdKTMkVyZ4c9g4NUqABGHgLio1fQc/h8ZcGClDcWou/rb7YfFzyq9j2UKT5FTuMkkHouPjM0Xa4kpsE33HIS45ApYWBe/56rJlML8CPf7OWP8sx0xv6l0RFPAsKWanbo6nE1FYLwE6CnKpTcrN94qDxYxol1xigpd7eUmcUnNkwYaIkNB3MZ2owWWyqqQuvugRB6ehYR4oQ32s/4KgOrKI0JW0Wey20ZuUp6zZqI11LEehAk3P5LBVBJsL+U1mb1zQ+8ir1LtTKMgcELEIzOd5HLnaq+ZWMd1XFJaaA2VFQqpVaMs2eJCnn59LtpBSFOKdBP4S+bJoAYzQF2hC2WO5zuP59rm99hKJ5AGQI+FzGRH+E3YO3JOxmrFxgomvBMyd5sSxnCM55eK
X-Microsoft-Antispam-PRVS: <DM3PR07MB2250BBE8FF397216B5FF5028C2740@DM3PR07MB2250.namprd07.prod.outlook.com>
X-Forefront-PRVS: 0961DF5286
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; DM3PR07MB2250;
 23:Su8RjcEYoQFjxHAyskE8AEloXjUA6VcCmrWcz7EXx?=
 =?us-ascii?Q?c0lnSo9qqihQm+hEEgEv2wgOyZWbLbNB2pz2OMpQ+QkZnb+BfUGjifWtdvdo?=
 =?us-ascii?Q?rRJ2zy0/EvXJcJacWpQaFXXusDFlLsBdE+VjLMdZ5cVnTPDr/PjlVs9jqy9s?=
 =?us-ascii?Q?q9nVEpMa4Yjj9r6nLvmTU4VZG0OOq+gSXIPKExcBtBdPWLx1bEV0Sd4IIZ0n?=
 =?us-ascii?Q?020s7WksmetnBZ0hW/550FWNkpAjEGVTwP2A5GJ4VL4h4Js0ziapat66NsDN?=
 =?us-ascii?Q?5LiL6+VBycqq9iMMu14c1UHWx0WHaGyNKLsIclMNQpz0FlTSkGEn9azMjhkK?=
 =?us-ascii?Q?NNuy5FBMSE00rDqIUo4S1X+4VNLRiVjzLbaJO7xakdAzVOySKoPdbXwhQBFg?=
 =?us-ascii?Q?EOwk7Ak+U0wYUEP1d+9q4z9CSac34h3G4u5YA4z5XumRgQdzdE/yB9CoiaMS?=
 =?us-ascii?Q?KT6R6XsUW0mCfphahSTU59aoKaCeJnYrvitlsuW835h+y9O45raiILXsSs7M?=
 =?us-ascii?Q?CgK9/X5rrkodtd/EAx5BkTlxJZkrnnHJg/s9N6XR3DfACsmpC7fQNqLwf4aM?=
 =?us-ascii?Q?GsU6R2dy7gq52JLTJTjnHMFp1LwrlicGjDBVYf6/Uvy5vAMTv5cMCWnR3nY5?=
 =?us-ascii?Q?hhjDw5CNiEmb0oPu8uRfW1/pb5UOF7QrQUPNIMHAcikt31K/8irReJYzyvG2?=
 =?us-ascii?Q?+gRBixdwNzfhaAAffQoj+5o6vh81lvV7aecg9pz/uvArZk2vEln4ZUfrhK0p?=
 =?us-ascii?Q?TIXocJe3iQZ1455HCKS5kvotNsU2Vdos9snMp/Dr0DbefvuCwNWfG6vEoOmC?=
 =?us-ascii?Q?QpZsILJRF9B6lc5n44BlOMrP3Npn713PyMh+yqOgZD14C4eDZgO8NmA7cour?=
 =?us-ascii?Q?Ag1fDI2cODE4W8gB+dsoeTFhho45dnnuF4L/JYa+sqJomN56my+KLwoxqBnX?=
 =?us-ascii?Q?gCWhg6fXL9fBIkGdzO8l930wZPoHGYslduAtXOq6GQG7FeeGZtm2XS474NE9?=
 =?us-ascii?Q?5RhfUCT8J1bt63x7meUaXDnKwjy8YnJl1SdjTFe8KGmcqIvQtsLZCVSWHWwZ?=
 =?us-ascii?Q?s+VGn1uO/cCjwkDi9EhOZs1sAfQ?=
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: tpDaz3yi9SGqzk3JU8jy8FUb1chCD2wScsNeBDFOlxoqF1hn23Wg5uFPvmRmZZhxePUN/s6JshPY67xh1lqhdDc/+EdA1HmAQkx9gVAkmJf/axl47oi1q5Wt/RfaSPP9GQyHx4hDbpUHnuQi9mm2yyb4FBjLAvz6S1JMvrkBubtH/Jk+c3jk2wNvs6wqJ2Qc5yOAbrfsQc9FVoKTBUiHbT1iLrqTGsskjPhidv+bBJUADq+LjIWc6xczAo8Obh2kAl53sQbDsQHUrCqcJm0hTg7xh+UaAnutNp/7XWGLH8avXyALpUkBn6koy0m/5tTcxZSrwLVQmifZ+1o7WOXvbqyxCgxXNTqHjdmfwy2lr1rdGE8OcGFlyWLrY0iTRPq54pAlS4r6M3Z0fJgVso67Y8XrBYuQEfGndjIEoRJqLnI=
X-Microsoft-Exchange-Diagnostics: 1; DM3PR07MB2250;
 20:a12Nk6oRESvAeZuUbFHDxFgoZ33Ih93U6Ra0uAeDqaJ+aUdPHCCmO0tC1slkdslS8EV2jdk6OsgkSy5WdBm35hepcC3XLZQ4dz6IzDwSLDWcyzcecmkM8rEcsBey5mLcdkaUz1DMBCTgw9PGZbheBbOjAIKVyw/bJyDpAQxj/m9hIRAwVIML9cFHkymIMo7Q6CW9jAFjVybxSu8Z3RvOZR4fcRrCKGc4o0kjqr182LEcLiXWyD9VISg5Gi1UsLnL
X-OriginatorOrg: cadence.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Feb 2019 18:38:00.1182 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 12cece6e-1123-4516-2a8c-08d69ce2b339
X-MS-Exchange-CrossTenant-Id: d36035c5-6ce6-4662-a3dc-e762e61ae4c9
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=d36035c5-6ce6-4662-a3dc-e762e61ae4c9; Ip=[158.140.1.28];
 Helo=[sjmaillnx2.cadence.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PR07MB2250
X-Proofpoint-SPF-Result: pass
X-Proofpoint-SPF-Record: v=spf1 include:_spf.salesforce.com
 include:mktomail.com
 include:spf-0014ca01.pphosted.com include:spf.protection.outlook.com
 include:auth.msgapp.com include:spf.mandrillapp.com ~all
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-02-27_13:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_check_notspam policy=outbound_check
 score=0
 priorityscore=1501 malwarescore=0 suspectscore=1 phishscore=0 bulkscore=0
 spamscore=0 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=843 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1902270125
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190227_103809_772840_899D3EEC 
X-CRM114-Status: UNSURE (   6.96  )
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

I3C MIPI spec does not clearly say that I2C 10bit devices are supported.
Additionally, it isn't possible to pass 10 bit device properly through DEFSLVS
command and reserve address for such device on secondary master side.

Przemyslaw Gaj (4):
  i3c: Drop support for I2C 10 bit addresing
  i3c: master: cdns: Drop support for I2C 10 bit addresing in Cadence
    I3C master
  i3c: master: dw-i3c-master: Remove i2c_funcs hook implementation
  dt-bindings: i3c: Document dropped support for I2C 10 bit devices

 Documentation/devicetree/bindings/i3c/i3c.txt |  4 +++-
 drivers/i3c/master.c                          | 19 +++++++++++--------
 drivers/i3c/master/dw-i3c-master.c            |  6 ------
 drivers/i3c/master/i3c-master-cdns.c          | 10 +---------
 include/linux/i3c/master.h                    |  5 +----
 5 files changed, 16 insertions(+), 28 deletions(-)

-- 
2.8.3


_______________________________________________
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
