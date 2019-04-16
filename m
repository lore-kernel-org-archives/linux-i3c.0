Return-Path: <SRS0=s+0C=SS=lists.infradead.org=linux-i3c-bounces+linux-i3c=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DCFB6C10F13
	for <linux-i3c@archiver.kernel.org>; Tue, 16 Apr 2019 07:32:09 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A777A2086A
	for <linux-i3c@archiver.kernel.org>; Tue, 16 Apr 2019 07:32:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="UatKj8Uk";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=cadence.com header.i=@cadence.com header.b="jRTDtufo";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=cadence.com header.i=@cadence.com header.b="VolhfTtL"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A777A2086A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=cadence.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=I4eYcOwveqw5cdMnjU9X9vxrjZm0BhJaJm6foBP2VYA=; b=UatKj8Uko2+P/T
	khlIF0gTLDI3V87UDeM1mYJ5CObE2kjV67AW+kF+GJaci0YRWCwRhFdPwyfoNiz8V/StQTCVYJ5UA
	KCnuAcxs6vg9HWxBLiovKDwzdNB0KEMGfDcfSU8+IXEqKZ7K+KiLKpM/il19iCDO45uLxehHBvPVi
	J5HDMtwCcqpVWDbalmlUXW4uBFKbJXI1Eg2ZMLFwL4EiRcZvfOMasl8Tbm/m+laBC2O3+nNmEzYDz
	597xLF43sqGaS7ADIRkf7KLiaiXoJCGVTtPfbrr90cJsKJl4rCyp/nU7fFZTS/4I09GEfujeRScHI
	YhLd3RAxP+j8hHT1qToA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hGIZd-0001Nj-6g; Tue, 16 Apr 2019 07:32:09 +0000
Received: from mx0a-0014ca01.pphosted.com ([208.84.65.235])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hGIZa-0001Mg-5v
 for linux-i3c@lists.infradead.org; Tue, 16 Apr 2019 07:32:08 +0000
Received: from pps.filterd (m0042385.ppops.net [127.0.0.1])
 by mx0a-0014ca01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x3G7Lcnl007167; Tue, 16 Apr 2019 00:32:02 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cadence.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-type; s=proofpoint;
 bh=YfLG8PW9y7tHP87RHTgLX+EemfoGc3Bc6I5r7fgUHZ0=;
 b=jRTDtufoqvQL5TTlMh65Jv6Uz8Ibz0hfYD3gSriGgDvpOyrBXgWeyWfwHLroxZYKfajb
 sGJFSfOdpRzKfcNEuObMI+lbCyxVYAyNU+x6iMThDkDwKNIQk4RKZ2inA4FzyU/k7ehY
 2xKtKLWYM3dDMhDonGech9J8pRjqlFGDGt3XhaxWJmZLOtjKSRt3Jp1m2VWxTAXgRekW
 TYjdjZ/9zCXwEdlWLnDpsZXK1GZUJV5RHusLQXW9UhR5bPZ6X2YPvBpMAnFyGUeUTOyo
 2h3v7K0ECRIBL4LxEaXwPjYtiiLt+E9Qv7Xv3XkBXBd9/ksfXouJdHiL+1go4VoVB8cm pg== 
Authentication-Results: cadence.com;
	spf=pass smtp.mailfrom=pgaj@cadence.com
Received: from nam04-bn3-obe.outbound.protection.outlook.com
 (mail-bn3nam04lp2058.outbound.protection.outlook.com [104.47.46.58])
 by mx0a-0014ca01.pphosted.com with ESMTP id 2rw74grvms-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT);
 Tue, 16 Apr 2019 00:32:01 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cadence.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YfLG8PW9y7tHP87RHTgLX+EemfoGc3Bc6I5r7fgUHZ0=;
 b=VolhfTtLHzfBHh4VPgTHQL+uV9lm2T3mt/icTEvpkb0qu6nzsn4cVdc4LVz0rh9uCfSWfqzyHvwFifW7kZ/EfeKxYbQr3vjJDw7tlxErsNl1ELOEpcPXH9uMrZdmz+bGtKVkJB/D9wzdoZMTqu9YAMco6JNzpxbJCXgUpJlb9iA=
Received: from DM6PR07CA0033.namprd07.prod.outlook.com (2603:10b6:5:94::46) by
 BYAPR07MB5816.namprd07.prod.outlook.com (2603:10b6:a03:12d::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.1792.16; Tue, 16 Apr
 2019 07:31:59 +0000
Received: from BY2NAM05FT049.eop-nam05.prod.protection.outlook.com
 (2a01:111:f400:7e52::207) by DM6PR07CA0033.outlook.office365.com
 (2603:10b6:5:94::46) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.1771.16 via Frontend
 Transport; Tue, 16 Apr 2019 07:31:58 +0000
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 cadence.com discourages use of 158.140.1.28 as permitted sender)
Received: from sjmaillnx1.cadence.com (158.140.1.28) by
 BY2NAM05FT049.mail.protection.outlook.com (10.152.100.186) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1792.7 via Frontend Transport; Tue, 16 Apr 2019 07:31:58 +0000
Received: from maileu3.global.cadence.com (maileu3.cadence.com [10.160.88.99])
 by sjmaillnx1.cadence.com (8.14.4/8.14.4) with ESMTP id
 x3G7VtFD014265
 (version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=OK);
 Tue, 16 Apr 2019 00:31:57 -0700
X-CrossPremisesHeadersFilteredBySendConnector: maileu3.global.cadence.com
Received: from maileu3.global.cadence.com (10.160.88.99) by
 maileu3.global.cadence.com (10.160.88.99) with Microsoft SMTP Server (TLS) id
 15.0.1367.3; Tue, 16 Apr 2019 09:31:55 +0200
Received: from lvlogina.cadence.com (10.165.176.102) by
 maileu3.global.cadence.com (10.160.88.99) with Microsoft SMTP Server (TLS) id
 15.0.1367.3 via Frontend Transport; Tue, 16 Apr 2019 09:31:55 +0200
Received: from lvlogina.cadence.com (localhost.localdomain [127.0.0.1])
 by lvlogina.cadence.com (8.14.4/8.14.4) with ESMTP id x3G7VsH2015438;
 Tue, 16 Apr 2019 08:31:54 +0100
Received: (from pgaj@localhost)
 by lvlogina.cadence.com (8.14.4/8.14.4/Submit) id x3G7VrLd015419;
 Tue, 16 Apr 2019 08:31:53 +0100
From: Przemyslaw Gaj <pgaj@cadence.com>
To: <bbrezillon@kernel.org>
Subject: [PATCH v5 0/2] Drop support for I2C 10 bit devices from I3C subsystem
Date: Tue, 16 Apr 2019 08:31:46 +0100
Message-ID: <20190416073148.14534-1-pgaj@cadence.com>
X-Mailer: git-send-email 2.8.3
MIME-Version: 1.0
X-OrganizationHeadersPreserved: maileu3.global.cadence.com
X-EOPAttributedMessage: 0
X-Forefront-Antispam-Report: CIP:158.140.1.28; IPV:CAL; SCL:-1; CTRY:US;
 EFV:NLI; SFV:NSPM;
 SFS:(10009020)(39850400004)(376002)(346002)(396003)(136003)(2980300002)(36092001)(199004)(189003)(54534003)(316002)(186003)(6916009)(16586007)(305945005)(5660300002)(8936002)(246002)(50226002)(51416003)(26826003)(476003)(356004)(42186006)(6666004)(126002)(2616005)(106466001)(107886003)(486006)(2906002)(47776003)(478600001)(76130400001)(8676002)(2351001)(4326008)(87636003)(36756003)(86362001)(1076003)(426003)(14444005)(336012)(26005)(7636002)(4744005)(50466002)(54906003)(105596002)(48376002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BYAPR07MB5816; H:sjmaillnx1.cadence.com; FPR:;
 SPF:SoftFail; LANG:en; PTR:corp.cadence.com; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2915ec76-6be9-495e-7e98-08d6c23d9bdb
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600140)(711020)(4605104)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328);
 SRVR:BYAPR07MB5816; 
X-MS-TrafficTypeDiagnostic: BYAPR07MB5816:
X-Microsoft-Antispam-PRVS: <BYAPR07MB5816DBC8EAFC507CB444BE65C2240@BYAPR07MB5816.namprd07.prod.outlook.com>
X-Forefront-PRVS: 000947967F
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: VmaX3AjVI7SE0/hkfkzIygMZ/a8ukRvXd9piKsSawJDdT4QRDRTjT2cYAmRe0SVp0sgHw8P3TUwHiUXHnGjORHyK9utXd1aq8rRsoIWuga2p108VIc3e9Hm41R98Ps9Z+RY6P9PIFR3uVTZ7INL4KtDmmaNI5Fxu7VJ6AmD+bzLueqeS6OS+aV3Rt1vc41sqYnJhEQrZcTdArTUKkCd7CaRuy6E+aYtuUFBJtH9NIsjQerf23KODWk3B/pRu3LRqdrelUGxqt8cPRFCKT0Uq9Jzy1WK5K/m4MAh1db1lyv97zX6pioKLXBLj5EqtXYtKbulyqUHPBwZmWcBdupUVZgD/tbCg3abPrm2y6LWG947+q4CjfA/NbiHf4w58MMx17pcfdVnWGjlmDIIoHLhuI6Ftdmxkt/GEhNklTkBGr94=
X-OriginatorOrg: cadence.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Apr 2019 07:31:58.2570 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2915ec76-6be9-495e-7e98-08d6c23d9bdb
X-MS-Exchange-CrossTenant-Id: d36035c5-6ce6-4662-a3dc-e762e61ae4c9
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=d36035c5-6ce6-4662-a3dc-e762e61ae4c9; Ip=[158.140.1.28];
 Helo=[sjmaillnx1.cadence.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR07MB5816
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
 mlxlogscore=966 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1904160052
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190416_003207_196834_BF807B16 
X-CRM114-Status: UNSURE (   7.87  )
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
