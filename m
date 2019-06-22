Return-Path: <SRS0=3/jM=UV=lists.infradead.org=linux-i3c-bounces+linux-i3c=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80786C4646B
	for <linux-i3c@archiver.kernel.org>; Sat, 22 Jun 2019 20:55:56 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 26EA020820
	for <linux-i3c@archiver.kernel.org>; Sat, 22 Jun 2019 20:55:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Pdyj8bC0";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=cadence.com header.i=@cadence.com header.b="c2fVcg8i";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=cadence.com header.i=@cadence.com header.b="iUY9tciD"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 26EA020820
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=cadence.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ENJ2Eh6g9vzXI3El2UAu0sEyWkEU/6kIszilWOHXUUM=; b=Pdyj8bC0vxFIPv
	Z3ywGJlVP/+Za/qeHjYESMBIRjOb56Uj6hn+54VNwh5dVuKWTHIZP7BsmRrmdO7mXUjBmSP11hZwg
	nbh19plrixezqHQDUYAkF7zGELpjj551wDqBkW5S5r1bPCbkxDS9mfX44QDjk/9sii0ISZZYduLm/
	hF+ZMiEcbiY3i140vilfI01Jv3qib2yoXjOKpKLHuD0xHR9l69FVcae9Tf5i7G4ActjRQnXmmdH6W
	lqZLdRS4YLSKgedft5rXyoJc0yd6Shzi+cGXjEcun7/WQXKORba6ETd6NeXb++eDlRCKttAnVmf04
	oC6Ib/gaprQkOKGVn+6Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hen3D-00078K-GU; Sat, 22 Jun 2019 20:55:55 +0000
Received: from mx0a-0014ca01.pphosted.com ([208.84.65.235])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hen3A-00077b-D9
 for linux-i3c@lists.infradead.org; Sat, 22 Jun 2019 20:55:54 +0000
Received: from pps.filterd (m0042385.ppops.net [127.0.0.1])
 by mx0a-0014ca01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x5MKqD4o030002; Sat, 22 Jun 2019 13:55:47 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cadence.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-type; s=proofpoint;
 bh=I+lIbikdghGOoBaAineLTCHfTeL0cosR/PqJ5Gu2EXc=;
 b=c2fVcg8ih5cvcKSXjcFqLXP2BsKijrEFk0LEDu8YwMnGgjl3yRodziqsZGsHGIPTt66x
 BzTrueqYbGg1r9B8iQTk5rMp7dmwRnV/Hq8WHLWI1pm/BiYal/iTcvHXwIqvKqmdGVPy
 OFNgqUJMlaNjMQnwJ030S5JgpU1RQMzFtdT4bOHX56YViXyG07bugoTUwBpcrQCRfgSB
 fkQcYAaU9z6jiiUdkGtzpFzQ/rcgnB39EHPg8Iq/bKUnPTWTIT45pDJFrf6892/hvFPO
 YWpRIfGM6diLIghgP8g6VZ2ir2byR6ETpLgze08+N9fTjr58yEP1AjcR6d9EDLL2t4rJ ng== 
Authentication-Results: cadence.com;
	spf=pass smtp.mailfrom=pgaj@cadence.com
Received: from nam04-co1-obe.outbound.protection.outlook.com
 (mail-co1nam04lp2055.outbound.protection.outlook.com [104.47.45.55])
 by mx0a-0014ca01.pphosted.com with ESMTP id 2t9gvs1cdx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 22 Jun 2019 13:55:46 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cadence.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=I+lIbikdghGOoBaAineLTCHfTeL0cosR/PqJ5Gu2EXc=;
 b=iUY9tciD5dPt9Fen0778U9Z//ZaOIP6QsHC8J/4rpUOdvIULG19mmiHi5Snk0QdP7oN9bsXZmhkwlm21tcdBKnUMEEHbywzuiwnht9LpZSvgK1r2pSZUofiGWefPCHn26eMifnZWaumpvshHu6qZS1vnKP0P7VrLPjqxusB04Lk=
Received: from CO2PR07CA0062.namprd07.prod.outlook.com (2603:10b6:100::30) by
 BY5PR07MB6966.namprd07.prod.outlook.com (2603:10b6:a03:1e7::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2008.16; Sat, 22 Jun
 2019 20:55:43 +0000
Received: from BY2NAM05FT039.eop-nam05.prod.protection.outlook.com
 (2a01:111:f400:7e52::202) by CO2PR07CA0062.outlook.office365.com
 (2603:10b6:100::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2008.13 via Frontend
 Transport; Sat, 22 Jun 2019 20:55:43 +0000
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 cadence.com discourages use of 199.43.4.28 as permitted sender)
Received: from rmmaillnx1.cadence.com (199.43.4.28) by
 BY2NAM05FT039.mail.protection.outlook.com (10.152.100.176) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2032.6 via Frontend Transport; Sat, 22 Jun 2019 20:55:42 +0000
Received: from maileu3.global.cadence.com (maileu3.cadence.com [10.160.88.99])
 by rmmaillnx1.cadence.com (8.14.4/8.14.4) with ESMTP id
 x5MKtcDN029122
 (version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=OK);
 Sat, 22 Jun 2019 16:55:40 -0400
X-CrossPremisesHeadersFilteredBySendConnector: maileu3.global.cadence.com
Received: from maileu3.global.cadence.com (10.160.88.99) by
 maileu3.global.cadence.com (10.160.88.99) with Microsoft SMTP Server (TLS) id
 15.0.1367.3; Sat, 22 Jun 2019 22:55:38 +0200
Received: from lvlogina.cadence.com (10.165.176.102) by
 maileu3.global.cadence.com (10.160.88.99) with Microsoft SMTP Server (TLS) id
 15.0.1367.3 via Frontend Transport; Sat, 22 Jun 2019 22:55:38 +0200
Received: from lvlogina.cadence.com (localhost.localdomain [127.0.0.1])
 by lvlogina.cadence.com (8.14.4/8.14.4) with ESMTP id x5MKtbkF009615;
 Sat, 22 Jun 2019 21:55:37 +0100
Received: (from pgaj@localhost)
 by lvlogina.cadence.com (8.14.4/8.14.4/Submit) id x5MKta1F009593;
 Sat, 22 Jun 2019 21:55:36 +0100
From: Przemyslaw Gaj <pgaj@cadence.com>
To: <bbrezillon@kernel.org>
Subject: [PATCH v5 0/7] Add the I3C mastership request
Date: Sat, 22 Jun 2019 21:54:58 +0100
Message-ID: <1561236905-8901-1-git-send-email-pgaj@cadence.com>
X-Mailer: git-send-email 2.4.5
MIME-Version: 1.0
X-OrganizationHeadersPreserved: maileu3.global.cadence.com
X-EOPAttributedMessage: 0
X-Forefront-Antispam-Report: CIP:199.43.4.28; IPV:CAL; SCL:-1; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(136003)(346002)(376002)(39860400002)(396003)(2980300002)(36092001)(189003)(199004)(16586007)(305945005)(42186006)(107886003)(69596002)(316002)(53936002)(54906003)(5660300002)(4326008)(26005)(186003)(47776003)(8936002)(48376002)(76130400001)(14444005)(26826003)(2906002)(50226002)(81166006)(8676002)(478600001)(51416003)(486006)(68736007)(81156014)(126002)(426003)(87636003)(2616005)(86362001)(356004)(6666004)(476003)(70586007)(50466002)(36756003)(2351001)(70206006)(6916009)(336012);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BY5PR07MB6966; H:rmmaillnx1.cadence.com; FPR:;
 SPF:SoftFail; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: efa47ba5-f2a8-40f7-3bca-08d6f753fdd2
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328);
 SRVR:BY5PR07MB6966; 
X-MS-TrafficTypeDiagnostic: BY5PR07MB6966:
X-Microsoft-Antispam-PRVS: <BY5PR07MB696605DA94E0BEC3E2EB1875C2E60@BY5PR07MB6966.namprd07.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-Forefront-PRVS: 0076F48C8A
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: Sx1IkxtpMjVTqle3/QdOAszg85jXWRCaXuhfczKEC6YgX5SiBRtlDebJ/PkifVELWX6m5mg1zAfkEED79G+iGOPhFURljX/ND9TtNOJHE4vWOIEonlKi81t+Jm3mgjRydLy41OZXvWHetVr5oKSCgmGrTmHnYEWOtlvmhWNkxcZypg2pXS0h/jEJn4fmeVZljZILt967t6dM9LntPu0YlW1cLfJ8mCzWFTvhwKJGsdHalTsyCBFdVJnABEDrQKLYNV9wHuzV6ONgwBk92Jz7s5Tl/QGU/U4LIM5yIh3Qn+CXbKKLqKzppMK6nwpPHACcBIKxsj3ytgyqee/SmSUQcQFrWWW/XDTp05iHlTTLvDiPTg9SK3XvEVXz9JHT+I7aW/8yVuexw267M3cWtEfTMmG4QXSWccXQ8QjL2ZAiIww=
X-OriginatorOrg: cadence.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jun 2019 20:55:42.9761 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: efa47ba5-f2a8-40f7-3bca-08d6f753fdd2
X-MS-Exchange-CrossTenant-Id: d36035c5-6ce6-4662-a3dc-e762e61ae4c9
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=d36035c5-6ce6-4662-a3dc-e762e61ae4c9; Ip=[199.43.4.28];
 Helo=[rmmaillnx1.cadence.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR07MB6966
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
 spamscore=0 clxscore=1011 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1906220190
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190622_135552_680401_0F88FF33 
X-CRM114-Status: GOOD (  11.26  )
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

This patch series adds support for mastership request to I3C
subsystem and Cadence I3C master driver. Mastership request
allows slave to become the master of the I3C bus.

Main changes between v4 and v5 are:
- Add populate_bus() hook
- Split i3c_master_register into init and register pair
- Split device information retrieval, let add partialy discovered devices
- Make i3c_master_set_info private
- Add separate function to register secondary master
- Reworked secondary master register in CDNS driver
- Export i3c_bus_set_mode

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

Przemyslaw Gaj (7):
  i3c: add addr and lvr to i2c_dev_desc structure
  i3c: split i3c_master_register into init - register pair
  i3c: export i3c_bus_set_mode function
  i3c: Add support for mastership request to I3C subsystem
  i3c: master: cdns: add support for mastership request to Cadence I3C
    master     driver.
  i3c: master: Add module author
  MAINTAINERS: add myself as co-maintainer of i3c subsystem

 MAINTAINERS                          |   1 +
 drivers/i3c/device.c                 |  26 ++
 drivers/i3c/internals.h              |   4 +
 drivers/i3c/master.c                 | 694 +++++++++++++++++++++++------
 drivers/i3c/master/dw-i3c-master.c   |  38 +-
 drivers/i3c/master/i3c-master-cdns.c | 837 +++++++++++++++++++++++++++--------
 include/linux/i3c/master.h           |  52 ++-
 7 files changed, 1303 insertions(+), 349 deletions(-)

-- 
2.4.5


_______________________________________________
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
