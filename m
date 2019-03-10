Return-Path: <SRS0=lIk1=RN=lists.infradead.org=linux-i3c-bounces+linux-i3c=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.0 required=3.0 tests=BAD_ENC_HEADER,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C52CBC43381
	for <linux-i3c@archiver.kernel.org>; Sun, 10 Mar 2019 13:59:30 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8B6EE207E0
	for <linux-i3c@archiver.kernel.org>; Sun, 10 Mar 2019 13:59:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="mSvNKMWV";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=cadence.com header.i=@cadence.com header.b="dFXMDbY5";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=cadence.com header.i=@cadence.com header.b="SJSuBjNJ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8B6EE207E0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=cadence.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=UPyNs6o9Y4q45UNOB1dUXhwKPF+c0q7IXtw71IKtdmU=; b=mSvNKMWVmX4vwm
	2p1kWKE5ZkszxEnIPN2ffsHu1g0L8tVWdVpNgbRJ4g7lcPbhFpZFg3ntWI/0Ubfxu7gN+pgplkmfs
	e1NfiyioOBK+l/w3oXhmybx41quFMy9WheaQuvFgdr0jJeeiQeZG9JUNSoI59axAsiCAa3Lcv5T01
	cuOHYveq/zxr1MdZOubuqrEP0NXb/EJPBT3at4TMsjOxdsR42zFM4JrIfaBVOBy3kw3VdnK9ejcfH
	HhvRfY4FmCyLF8JRGaGL9Oe7V2FIy2z6N3H9mZC0vrwPu1ibZ4dwt830MbWRDe/ybwFKbNWk78Mju
	CntsgK79tovqK5sTzK+A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h2yzB-0002sW-Ss; Sun, 10 Mar 2019 13:59:29 +0000
Received: from mx0b-0014ca01.pphosted.com ([208.86.201.193]
 helo=mx0a-0014ca01.pphosted.com)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h2yz7-0002qP-BT
 for linux-i3c@lists.infradead.org; Sun, 10 Mar 2019 13:59:27 +0000
Received: from pps.filterd (m0042333.ppops.net [127.0.0.1])
 by mx0b-0014ca01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x2ADspKO025223; Sun, 10 Mar 2019 06:59:16 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cadence.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-type; s=proofpoint;
 bh=ROWCf5rkP1jcBU/JNx68fh99ex2xz86E58k0p0PZdro=;
 b=dFXMDbY5Q0YOItl6y4UW63HN2f8w6OFqzcXCD3fiFt+RJeIm0wnIJg/9+6innn0kpS3S
 U3WHvVFnaVT9RsU1f3cmd3t7xZK2b1u61BtqafmOOkdAB8/VA6t+xf45huw+CBE14QC0
 qxEkO3F0N0ZJB+7aAICL5UF4bGlIWZAvaTNMu0d/tQ5Sb5k18fsM5wLxJRbobLBkWyj4
 rk9/VGTI4J5eiYf3bBELwNwEX/EVUf9NA8M8VdGxeKwATsB20jgNlxb83eVp6gCL5BT7
 CIjOKx7DfT5vpJ3b1E2cSeMg8gCZawTunjWavMq9LuCUyyJ9hinwh7EUDZHhrC1wutj7 Vg== 
Authentication-Results: cadence.com;
	spf=pass smtp.mailfrom=pgaj@cadence.com
Received: from nam02-cy1-obe.outbound.protection.outlook.com
 (mail-cys01nam02lp2059.outbound.protection.outlook.com [104.47.37.59])
 by mx0b-0014ca01.pphosted.com with ESMTP id 2r49y1cqy5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sun, 10 Mar 2019 06:59:16 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cadence.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ROWCf5rkP1jcBU/JNx68fh99ex2xz86E58k0p0PZdro=;
 b=SJSuBjNJAoD2UFU8oXdBnhO1Bw/iyl5+Ytjt9bGe4YPFoYRZS+sYtDLSBemtx1SSrq0gQtSE/75VejPakx9/D1lSkHCngbGFGtkmB+9EqHCMhIp3CUtD8Bbq/olCn3U4N3cpyC9Y76pgo7XC9hmMMX2G9eXthkyVdnv+iyfd/R4=
Received: from BYAPR07CA0099.namprd07.prod.outlook.com (2603:10b6:a03:12b::40)
 by DM6PR07MB5913.namprd07.prod.outlook.com (2603:10b6:5:181::27) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.1686.17; Sun, 10 Mar
 2019 13:59:14 +0000
Received: from CO1NAM05FT048.eop-nam05.prod.protection.outlook.com
 (2a01:111:f400:7e50::204) by BYAPR07CA0099.outlook.office365.com
 (2603:10b6:a03:12b::40) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.1686.17 via Frontend
 Transport; Sun, 10 Mar 2019 13:59:13 +0000
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 cadence.com discourages use of 158.140.1.28 as permitted sender)
Received: from sjmaillnx1.cadence.com (158.140.1.28) by
 CO1NAM05FT048.mail.protection.outlook.com (10.152.96.163) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1709.11 via Frontend Transport; Sun, 10 Mar 2019 13:59:13 +0000
Received: from maileu3.global.cadence.com (maileu3.cadence.com [10.160.88.99])
 by sjmaillnx1.cadence.com (8.14.4/8.14.4) with ESMTP id
 x2ADx9Wx013509
 (version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=OK);
 Sun, 10 Mar 2019 06:59:11 -0700
X-CrossPremisesHeadersFilteredBySendConnector: maileu3.global.cadence.com
Received: from maileu3.global.cadence.com (10.160.88.99) by
 maileu3.global.cadence.com (10.160.88.99) with Microsoft SMTP Server (TLS) id
 15.0.1367.3; Sun, 10 Mar 2019 14:59:06 +0100
Received: from lvlogina.cadence.com (10.165.176.102) by
 maileu3.global.cadence.com (10.160.88.99) with Microsoft SMTP Server (TLS) id
 15.0.1367.3 via Frontend Transport; Sun, 10 Mar 2019 14:59:06 +0100
Received: from lvlogina.cadence.com (localhost.localdomain [127.0.0.1])
 by lvlogina.cadence.com (8.14.4/8.14.4) with ESMTP id x2ADx5B7022371;
 Sun, 10 Mar 2019 13:59:05 GMT
Received: (from pgaj@localhost)
 by lvlogina.cadence.com (8.14.4/8.14.4/Submit) id x2ADx44C022342;
 Sun, 10 Mar 2019 13:59:04 GMT
From: Przemyslaw Gaj <pgaj@cadence.com>
To: <bbrezillon@kernel.org>
Subject: [PATCH v4 0/6] Add the I3C mastership request
Date: Sun, 10 Mar 2019 13:58:37 +0000
Message-ID: <20190310135843.21154-1-pgaj@cadence.com>
X-Mailer: git-send-email 2.8.3
MIME-Version: 1.0
X-OrganizationHeadersPreserved: maileu3.global.cadence.com
X-EOPAttributedMessage: 0
X-Forefront-Antispam-Report: CIP:158.140.1.28; IPV:CAL; SCL:-1; CTRY:US;
 EFV:NLI; SFV:NSPM;
 SFS:(10009020)(39860400002)(376002)(346002)(396003)(136003)(2980300002)(36092001)(189003)(199004)(305945005)(7636002)(87636003)(26826003)(478600001)(26005)(36756003)(2616005)(336012)(5660300002)(86362001)(426003)(14444005)(6666004)(356004)(1076003)(8676002)(476003)(126002)(47776003)(8936002)(42186006)(107886003)(246002)(16586007)(316002)(54906003)(186003)(2906002)(4326008)(50226002)(6916009)(486006)(2351001)(50466002)(105596002)(106466001)(48376002)(51416003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM6PR07MB5913; H:sjmaillnx1.cadence.com; FPR:;
 SPF:SoftFail; LANG:en; PTR:corp.cadence.com; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 80bfc022-6f58-4fd9-4ccc-08d6a56093c2
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600127)(711020)(4605104)(2017052603328)(7153060);
 SRVR:DM6PR07MB5913; 
X-MS-TrafficTypeDiagnostic: DM6PR07MB5913:
X-Microsoft-Exchange-Diagnostics: 1; DM6PR07MB5913;
 20:WUktn8tp0WCnkm/qssnb2iz3ipt5ZctldqA4ibs96/qzi/QsYfM7vPAcKJC8IuWg0PN97xxh5FffwJ67tqQHjLgDuZlR/+Yf9Js5nVJyyTNFMgNfKM0qh9Nj1C/lEXnSYgQ3+GmdLPU5M5zdEzENUstWV0QMOxYSUEyK4I/FcJhgmGHuiBdb/vjPUK02yssd5wUAhdC8uAZri6F0h97Pnotj3fc5mzcn5WwNWTLGs14zEIaHuZs2Iz2rrXo1gztXlSp+VJFnRdcvFuUK3jCYkuSxUXxgU+AP7+50MgAKXVuPBZP62dg6hl3T3isAVqasH7ScepMxB1da2EaCVCxpe+UOFWS7U8U+O7kLGloESjq3gy9FIAZCZsqLkawzBQhicznLdOO/WmnuVPC0wXeQHWhKUFgie5qMpx3QaD7jPOsi5AqjCpJHGM0tJaWRkWhLV6fC5e5yGga+gOY45LqPEil6LnvIZwgTmpCh0t3vvoyqlHdOq7PQoctxlsoW8Sl/
X-Microsoft-Antispam-PRVS: <DM6PR07MB591305718C58BB75B9AF76FBC24F0@DM6PR07MB5913.namprd07.prod.outlook.com>
X-Forefront-PRVS: 0972DEC1D9
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; DM6PR07MB5913;
 23:WSxejxFt1VbJiPEUYrZmqsgsOAVat5G48GCd6lwGK?=
 =?us-ascii?Q?srKkO8a7rK6DYTrKboBZB8KpEdUJV+Fi+RbXqTqeHQDBaOeT3NfGJ6DxScd1?=
 =?us-ascii?Q?vW7jWga26h5bcmzAg6ug8G57OI26Q6RTdfS8YHCUIQqWSUOO8rqSJ0RLsf6Z?=
 =?us-ascii?Q?zvQzj8nysYhccrlCyWckRlrnwKfsyHqsdVn3szSPjF85e3J93EkrvX7gw7Cu?=
 =?us-ascii?Q?wnMZRBqf8wPunANiDNZV0opU64131ek2G9HMx7V5YeLSrjXDuVNJPdZ6R5co?=
 =?us-ascii?Q?qYoJUfggSsop7SfYuUCzgH5eazfFblQQLqWY93FAxIL3yD1IuaACce+895TY?=
 =?us-ascii?Q?/E7fE7BcDdXMJUK6oCmlwSLBBcZszQ8lYjXLWqThni99HrDIzeNw8RqkyByo?=
 =?us-ascii?Q?DGyoVDnE9lOEbxLcIT0weDtD4/0xSI+ou8wjUWTKYL0bYfR/cxEQt91D5gm6?=
 =?us-ascii?Q?i8ctMpM/Y/8TjnEvv5LozGKSzuEZ0JVhVMull+KTnn9iZgvV6BdC9ctSUxE8?=
 =?us-ascii?Q?48pCJ+IItUlStdlsNUmsmx5ZuomwtsS+LBkgMHTyGqWwYLUCJxNYo2d5WaHA?=
 =?us-ascii?Q?6PTZsDV3BHfzGEZ9K3gMmEpOIfPjtPpOexlCd7IoUk95KtuR3WEiAPnflFys?=
 =?us-ascii?Q?ndH0hHwFfr0NUTrPH1EFu0KScUuWxWXcxPzu7hZSmiTDl14vlX6qGmxrAETY?=
 =?us-ascii?Q?KNiQ8r+sJVPYcBDM3De75r/WJhaEvR2+r4gLG4fNgHaukoij2753SGHuF8LZ?=
 =?us-ascii?Q?XV13HqI7byxR/+2Hp079PHyu3J8X7256hcaYTV1AvbwfGtCnAMoWPHWqkbqm?=
 =?us-ascii?Q?499YP0KrHNIMm+rVOOcWVWdQ1yiZ2Okfh64yelHAC2WZCnUmaJdFdBk6zXVx?=
 =?us-ascii?Q?Hrn1s2EU6TxOe/D+2eHDgZ3Y2XAgMwh5Wov5XfXK3WuqRXNOY7+gR1PQ2Fxx?=
 =?us-ascii?Q?yFZ6X/dd///kYRWbSuXDcfW3S6PRForp63hmQdcMXDVjJbl2AUlx7u8aFtJn?=
 =?us-ascii?Q?cKL8SsH8SIAMzljaodgyqKQs0Wz5cvJpCjB8p3/zbI4NI2gU+C1MnbkEapcO?=
 =?us-ascii?Q?6XtUz0ETUhjbgGKyDt4D36hJiiz?=
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: yCrlp12C7GKY6CKd8ADO8DbSMWFQ15DtYmUKyL5TjWKvhxhfdF0yu74nUYlqTgLpX18R8UqR5hNUlp3EGHKVUBJwrOY9mJpVauCmNdBNGL87xDgucVl7Zr9jDHX/vWu55AdskougB7QOKxfNlWW/o7IuidmxXL4jYViCyx+FOHAj4g8SWDdT6YwrxZwIarriODTYNfvojx4d5DWzOOVymj1N9zd1YX2VAJrwAB2rdQHDXD+4CckK5WpvHsrM7sX12CyiKIH1fsgR7nufCGp88bqWT6aHNHztUMbVcTGwmeQMKGrc2aoEpe/CLiRPqraPz7pH4lAFlfHESSXH1fMgqKwciOw/bwNTNv4hnhkzeaSTi77fTvn8d5jXSMJFv0cgpju98sOpxgEuM6bWdK+jgElomQr8Bg6qx8K+S/DJyWo=
X-Microsoft-Exchange-Diagnostics: 1; DM6PR07MB5913;
 20:oA+Qv0lirXQudFzA3xCbYxPDuP23Z/aIXwk4kXxQb1hXqWpphsyiUiXW/UzieARDcR4ogHpTQtnqILvlGs7bMUZ3SdqAsFnLoMMNANCiInXnAkfSujmMoOpsPJggAwoH0C1vojpaP0arZFvYm/qCVEclLAvm3kCo2Baq6yQ5Wn+UYK5JuM17Wzj+UMFpj4+rV9Zx2Ox8jhPH0dntO2dFlnYhXR4X65qGP4eRtV+xHoFEhknhy5spvz8ti0x5En80
X-OriginatorOrg: cadence.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Mar 2019 13:59:13.2440 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 80bfc022-6f58-4fd9-4ccc-08d6a56093c2
X-MS-Exchange-CrossTenant-Id: d36035c5-6ce6-4662-a3dc-e762e61ae4c9
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=d36035c5-6ce6-4662-a3dc-e762e61ae4c9; Ip=[158.140.1.28];
 Helo=[sjmaillnx1.cadence.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR07MB5913
X-Proofpoint-SPF-Result: pass
X-Proofpoint-SPF-Record: v=spf1 include:_spf.salesforce.com
 include:mktomail.com
 include:spf-0014ca01.pphosted.com include:spf.protection.outlook.com
 include:auth.msgapp.com include:spf.mandrillapp.com ~all
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-03-10_12:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_check_notspam policy=outbound_check
 score=0
 priorityscore=1501 malwarescore=0 suspectscore=1 phishscore=0 bulkscore=0
 spamscore=0 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=971 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1903100109
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190310_065925_698516_6BB93EDB 
X-CRM114-Status: GOOD (  10.34  )
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

This patch series adds support for mastership request to I3C
subsystem and Cadence I3C master driver. Mastership request
allows slave to become the master of the I3C bus.

Main changes between v3 and v4 are:
- Reworked acquire bus ownership
- Refactored the code

Main changes between v2 and v3 are:
- Added DEFSLVS devices are registered from master driver
- Reworked I2C registering on secondary master side
- Reworked Mastership event is enabled/disabled globally (for all devices)

Main changes between initial version and v2 are:
- Reworked devices registration on secondary master side
- Reworked mastership event disabling/enabling
- Reworked bus locking during mastership takeover process
- Added DEFSLVS devices registration during initialization
- Fixed style issues

Przemyslaw Gaj (6):
  i3c: add addr and lvr to i2c_dev_desc structure
  i3c: export bus maintenance lock and unlock functions
  i3c: Add support for mastership request to I3C subsystem
  i3c: master: cdns: add support for mastership request to Cadence I3C
    master driver.
  i3c: master: Add module author
  MAINTAINERS: add myself as co-maintainer of i3c subsystem

 MAINTAINERS                          |   1 +
 drivers/i3c/device.c                 |  26 ++
 drivers/i3c/internals.h              |   4 +
 drivers/i3c/master.c                 | 425 ++++++++++++++++++++++++------
 drivers/i3c/master/i3c-master-cdns.c | 495 +++++++++++++++++++++++++++++++----
 include/linux/i3c/master.h           |  25 ++
 6 files changed, 849 insertions(+), 127 deletions(-)

-- 
2.8.3


_______________________________________________
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
