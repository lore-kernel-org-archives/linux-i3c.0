Return-Path: <SRS0=lIk1=RN=lists.infradead.org=linux-i3c-bounces+linux-i3c=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=BAD_ENC_HEADER,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1408FC43381
	for <linux-i3c@archiver.kernel.org>; Sun, 10 Mar 2019 13:59:35 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D6AE9207E0
	for <linux-i3c@archiver.kernel.org>; Sun, 10 Mar 2019 13:59:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="uAp1rWVO";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=cadence.com header.i=@cadence.com header.b="PD8F9M73";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=cadence.com header.i=@cadence.com header.b="X5Gtbwma"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D6AE9207E0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=cadence.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZRF2+cWYodznSK5DYISC/SqBM9K35+lrz/6lwd7ria4=; b=uAp1rWVO1lgBvM
	Tt90z7vSaq7GK8uzAe701F1IMvT4wskkt+RlYvP/DrMRckukpXtuEjoB1GjLBP4qMc4ywGruM58Ik
	3EmvYu332QmtxH/9Oz5P0NdqSaJycdYbVvhgY+A853yRIW8/ddh71O9oSO6PKaHHQ+x4QOeMwazT+
	ul+wLZNRT/nADF2oR74ngoShj7RfHc8H4T6DcoBGGVWxSOj7totCnYM7NpyY/Vm8ROh6k9uI/IxzR
	Xz5Z0xKmjvUY8iyFj2YZDjafxqAGEt05kLCSxyXXiFnTKu2giju/MVFyi7qJHEHRM7qEgWh1l57ZL
	q69I/YBUpFtxFARXSSxQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h2yzG-0002tl-GE; Sun, 10 Mar 2019 13:59:34 +0000
Received: from mx0b-0014ca01.pphosted.com ([208.86.201.193]
 helo=mx0a-0014ca01.pphosted.com)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h2yz8-0002qZ-2R
 for linux-i3c@lists.infradead.org; Sun, 10 Mar 2019 13:59:31 +0000
Received: from pps.filterd (m0042333.ppops.net [127.0.0.1])
 by mx0b-0014ca01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x2ADsjwt025201; Sun, 10 Mar 2019 06:59:23 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cadence.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=proofpoint;
 bh=KZ3wyp5UjD+yomnybNIpqTpFQ00M1Gvatduec60PRGs=;
 b=PD8F9M73GahKCXd9hwNzMzTPnpqx+dczBkA2ziClmI2+oEx5wiKZ2q7uGE05dCHVap23
 ffLw5XUc7pbUPtMhWvgiHUYDKOYuQon/i0RqeJo28Smb4KkSACTy9lK2rRwvV/aoiIJ+
 vbdoTIPUINUMq1ABg/rE/b+VNfcBhQN5Vry4JzaIMbvpRxicWkGH9pMWiMZ+5LoyxZ0U
 vZsdiD+NqrPsX2xyFudBEXyDUbpiEfqDYDm8YzePcTyOP1JOUEvDlFF+Zv14zLkGJMBx
 8TK8DRoD+DjKXzEaafcn3pevR5wnyTMCjkOpwHYySgOuJkKAtVypVMGU+Aad3GBmiczb Pg== 
Authentication-Results: cadence.com;
	spf=pass smtp.mailfrom=pgaj@cadence.com
Received: from nam05-by2-obe.outbound.protection.outlook.com
 (mail-by2nam05lp2050.outbound.protection.outlook.com [104.47.50.50])
 by mx0b-0014ca01.pphosted.com with ESMTP id 2r49y1cqyn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT);
 Sun, 10 Mar 2019 06:59:23 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cadence.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KZ3wyp5UjD+yomnybNIpqTpFQ00M1Gvatduec60PRGs=;
 b=X5GtbwmatPpR5Y+4fNGSWq1c9Zkx1W7i3GjxtJTIoR96ryxkUUh2gSTAf6K9ExtfdsCAEcvQq0ZTLslxm7VRETtMF4y5ku5JNCgbOnEJz3m0WL/sjOW7c+lXPTA66NphaY8OMIm2o2sNp96RXhes6EpBxxE8P+GShKNV0JujV6w=
Received: from DM5PR07CA0080.namprd07.prod.outlook.com (2603:10b6:4:ad::45) by
 BN7PR07MB4706.namprd07.prod.outlook.com (2603:10b6:406:f1::33) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1686.19; Sun, 10 Mar 2019 13:59:19 +0000
Received: from BY2NAM05FT032.eop-nam05.prod.protection.outlook.com
 (2a01:111:f400:7e52::206) by DM5PR07CA0080.outlook.office365.com
 (2603:10b6:4:ad::45) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.1686.20 via Frontend
 Transport; Sun, 10 Mar 2019 13:59:19 +0000
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 cadence.com discourages use of 158.140.1.28 as permitted sender)
Received: from sjmaillnx2.cadence.com (158.140.1.28) by
 BY2NAM05FT032.mail.protection.outlook.com (10.152.100.169) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.1709.11 via Frontend Transport; Sun, 10 Mar 2019 13:59:18 +0000
Received: from maileu3.global.cadence.com (maileu3.cadence.com [10.160.88.99])
 by sjmaillnx2.cadence.com (8.14.4/8.14.4) with ESMTP id
 x2ADxEpm032144
 (version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=OK);
 Sun, 10 Mar 2019 06:59:18 -0700
X-CrossPremisesHeadersFilteredBySendConnector: maileu3.global.cadence.com
Received: from maileu3.global.cadence.com (10.160.88.99) by
 maileu3.global.cadence.com (10.160.88.99) with Microsoft SMTP Server (TLS) id
 15.0.1367.3; Sun, 10 Mar 2019 14:59:14 +0100
Received: from lvlogina.cadence.com (10.165.176.102) by
 maileu3.global.cadence.com (10.160.88.99) with Microsoft SMTP Server (TLS) id
 15.0.1367.3 via Frontend Transport; Sun, 10 Mar 2019 14:59:11 +0100
Received: from lvlogina.cadence.com (localhost.localdomain [127.0.0.1])
 by lvlogina.cadence.com (8.14.4/8.14.4) with ESMTP id x2ADxBnd022579;
 Sun, 10 Mar 2019 13:59:11 GMT
Received: (from pgaj@localhost)
 by lvlogina.cadence.com (8.14.4/8.14.4/Submit) id x2ADxB2G022578;
 Sun, 10 Mar 2019 13:59:11 GMT
From: Przemyslaw Gaj <pgaj@cadence.com>
To: <bbrezillon@kernel.org>
Subject: [PATCH v4 3/6] i3c: Add support for mastership request to I3C
 subsystem
Date: Sun, 10 Mar 2019 13:58:40 +0000
Message-ID: <20190310135843.21154-4-pgaj@cadence.com>
X-Mailer: git-send-email 2.8.3
In-Reply-To: <20190310135843.21154-1-pgaj@cadence.com>
References: <20190310135843.21154-1-pgaj@cadence.com>
MIME-Version: 1.0
X-OrganizationHeadersPreserved: maileu3.global.cadence.com
X-EOPAttributedMessage: 0
X-Forefront-Antispam-Report: CIP:158.140.1.28; IPV:CAL; SCL:-1; CTRY:US;
 EFV:NLI; SFV:NSPM;
 SFS:(10009020)(346002)(376002)(396003)(39860400002)(136003)(2980300002)(36092001)(189003)(199004)(8676002)(426003)(336012)(2906002)(30864003)(5660300002)(76176011)(51416003)(186003)(26005)(36756003)(54906003)(16586007)(42186006)(316002)(1076003)(478600001)(87636003)(26826003)(356004)(6666004)(246002)(105596002)(48376002)(47776003)(50466002)(7636002)(107886003)(305945005)(8936002)(446003)(86362001)(4326008)(2351001)(486006)(11346002)(14444005)(5024004)(6916009)(2616005)(476003)(106466001)(126002)(50226002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN7PR07MB4706; H:sjmaillnx2.cadence.com; FPR:;
 SPF:SoftFail; LANG:en; PTR:corp.cadence.com; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: fc8069f8-ff53-417a-d4df-08d6a5609706
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600127)(711020)(4605104)(2017052603328)(7153060);
 SRVR:BN7PR07MB4706; 
X-MS-TrafficTypeDiagnostic: BN7PR07MB4706:
X-Microsoft-Exchange-Diagnostics: 1; BN7PR07MB4706;
 20:gvsxg7ZeFeNT3NRy4t5u2e4DVelYAUXOIjWWKdr1KsgTPSSC5jwWLHQzfCdJsyefmOPN2FRpZ6oiE64So1+lfkvREt5mqIdHaSW/UcSNkJGAg88WFcriDO/n11QGpUya2Lgn89whN8pKmOyLLRe88s+zLYDx6kiH3Zwhv5gAdrhdQMQKc+S+VF8Pcl1ghEJ6/FXOAwU38572wfigbmStsld11XLZV1Tzx9RiId2TVDZPfoFdRdFz0QjPB1M+VV0fAPrPKf3rK4uXIq1dfQUAEKQSIqu+aoyAtzUvterPQmEHbratFIOMCkwn9zjK21suUee7k5Nux1JXmlVIbQTjs91pBSXCSbU5EcE12pPzs+QXd9TXBgUUTDeCqhI6zT0bLFRdSkBSW8iLK0OtZh/Hp0kndklYgjndjhMgQlNom1S3tZdZfIaIZP8CdqECYZbRoWtK5dEzIR8viheS+y3HTuqm2vFcS/ET9QHe5LkKw/xHl6XJSNHPmgDM+9BlcBGk
X-Microsoft-Antispam-PRVS: <BN7PR07MB4706644D680E2F0864A68C5FC24F0@BN7PR07MB4706.namprd07.prod.outlook.com>
X-Forefront-PRVS: 0972DEC1D9
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; BN7PR07MB4706;
 23:npY71nhYC8CJLqgUFPbFl2inlbggtUDV5QMXVbpq8?=
 =?us-ascii?Q?VIfnYPSnAMBbpabpcj87JZr9Dbh7wt617atxOqzQ5HqUj2ksqezQzAxvT2Rh?=
 =?us-ascii?Q?rPDKKtFJT6xyXbxeIRQZkbVaoBQvrHj64l8Z0nE2YctvOGckgOEoMMZokJee?=
 =?us-ascii?Q?4MOiTP+34D/s7CbVCu7hrY5Htjb8/5JxyNCq+GwuAohY63+SY5shdelHhBps?=
 =?us-ascii?Q?E9P5V2HbPT4CMb631GapovSbNz/87MMf21lL8hPghB0qkwAUa5lWKPT+08yS?=
 =?us-ascii?Q?dxRVfUFiD8q005aoWy31BBVM87MeKWG9BCogC7zgF2jyj7Gpk/JqapEy+5c4?=
 =?us-ascii?Q?FVrUbd6Q0EPMUnbp+RruBJ6wihR/EhztPgqmVVargumiAOH0p87HHi8Y0BoQ?=
 =?us-ascii?Q?lVoGXJPmVd/dybfDV3fXOSTshJxbx5smeuUCn5X47854XaRYrLpzS1exb07E?=
 =?us-ascii?Q?4yfFcqao4FvRSvpgJ8RlDLvhAqECPkPk3/4c9JiASYCVCfhAuLhkjpzjSrxK?=
 =?us-ascii?Q?obQe6n6lWGrNXqSsGZ3/4lYnDpxTUfyHbHcJL12ZQoIRssZEcXaGOIOAL5ff?=
 =?us-ascii?Q?nmQpKn6fFw4LTsIuUfrVgduJPbbBljuSCQEoH5gWMuAvNKNcP0kPOQiHa5NV?=
 =?us-ascii?Q?9EkfdAB9Rd9joaKTjbH6+GHWjmtVgemQJEKgxil7CEVqr09lWbHJNtvrou5y?=
 =?us-ascii?Q?6PctnOp1CYuIOfHiyHRXErNvQv5dKGmT06KRggmdDXxbw5SlLK5GXrGAcpXd?=
 =?us-ascii?Q?8Naiuahq+GrRJwmMhr1NEst+Zf+HLTUTOmXlFXfX2LLORVaX1VOajZrsRZPA?=
 =?us-ascii?Q?LR4q1flnMdXBENypaEUW2OD64N3ZhkuQBWaNky1vOmJG//vZtGQqjXKe60ol?=
 =?us-ascii?Q?xK/zjJNWa07l2PpMB61IL2980ln41Rd0y3puBYuotiKVIf8HC8l+hS7BPYZr?=
 =?us-ascii?Q?dVpYDmz+1Q3tOrNHA3EXmf4gHKhaBO3yAbuvyRjWzCkd13PPgMz7T7VAPAFM?=
 =?us-ascii?Q?693Fom5L9AsYWodUAna4/vozXZTWpFXtYbtI401Gol7lWur7ppTblESQNN4P?=
 =?us-ascii?Q?E+GPLiHNnz02IIwgYXmVmwzhAArs2cRq3+CzdFNuA51umcdT9FS20uJYcaPy?=
 =?us-ascii?Q?LQTvGhB3Y7sYANnX4Mt0A0WlUfQo3eX7Qc4hg7fgC8ZneePzX7uzQ=3D=3D?=
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: bAYaE1f1UYbtorPQVN9uB3dMoHvrgtbVDBIU3FrQ4HxHn7lmw1VxiBdHGHxdtcNYU6DqcAOiePHDxfbAPqA4ew4FbjZUyE+C5mPKXsgMAP929EB/o2CpLYKR9dGPBGIDrCsmB+Y7fwPXc7jmoDSndPFMusjqrQife7s63pRbrHKIWJUIKNHCQzeIoMTDkuRJGdUx8CF+zfMQtabRkCVU6XXgiHeNyxaOBvpRX9qC2T8v7u3pj9PKaoYjhAm2BBwLZPom11RECaqfEI+bldxKlAc0nXW80mvbV11fFNFSvXMsZ5J13ASbe0o1KmyV6jspbvIeA+qFAu6nFvkaydGND5Nbkoj+fThcMx6fxJtD5xWm8iyXlj07tG0MnvuqvzO3NFmyodLSEdasTdF2otHRsRWglcEfNXmljDkybmspyAw=
X-Microsoft-Exchange-Diagnostics: 1; BN7PR07MB4706;
 20:pWW+T7wsn0j1i5UOgTzHyiP16+RfhmWbIoPP03XX/9V0Cs/MjrinYJTdO3oHSACQwAdlVduF/3BvmzlPqGvyhd3jAxCunu3IYqLkLwxugKupFwYaRqFxuOo9QgabVFDuPfnufIOxMP4hBot+xq1OYa3iDmHBUwrmUo7xRGgL7xKj3eS5oLLh3TQKsuCLLahv5rbkNKqeco/nR9th0RB1KpY3Uuw9b6OnQnKBDfWfnjbIqM1ongbu3IV8wXOysZSS
X-OriginatorOrg: cadence.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Mar 2019 13:59:18.8094 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fc8069f8-ff53-417a-d4df-08d6a5609706
X-MS-Exchange-CrossTenant-Id: d36035c5-6ce6-4662-a3dc-e762e61ae4c9
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=d36035c5-6ce6-4662-a3dc-e762e61ae4c9; Ip=[158.140.1.28];
 Helo=[sjmaillnx2.cadence.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PR07MB4706
X-Proofpoint-SPF-Result: pass
X-Proofpoint-SPF-Record: v=spf1 include:_spf.salesforce.com
 include:mktomail.com
 include:spf-0014ca01.pphosted.com include:spf.protection.outlook.com
 include:auth.msgapp.com include:spf.mandrillapp.com ~all
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-03-10_12:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_check_notspam policy=outbound_check
 score=0
 priorityscore=1501 malwarescore=0 suspectscore=3 phishscore=0 bulkscore=0
 spamscore=0 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1903100109
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190310_065926_242152_9EFA5B28 
X-CRM114-Status: GOOD (  17.15  )
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

This patch adds support for mastership request to I3C subsystem.

Mastership event is enabled globally.

Mastership is requested automatically when device driver
tries to transfer data using master controller in slave mode.

There is still some limitation:
- I2C devices are registered on secondary master side if boardinfo
entry matching the info transmitted through the DEFSLVS frame.

Signed-off-by: Przemyslaw Gaj <pgaj@cadence.com>

---

Main changes between v3 and v4:
- Add i3c_master_acquire_bus_ownership to acquire the bus
- Refactored the code

Main changes between v2 and v3:
- Add i3c_bus_downgrade_maintenance_lock() for downgrading the bus
lock from maintenance to normal use
- Add additional fields to i2c_dev_desc for DEFSLVS purpose (addr, lvr)
- Add i3c_master_register_new_i2c_devs() function to register I2C devices
- Reworked I2C devices registration on secondary master side

Changes in v2:
- Add mastership disable event hook
- Changed name of mastership enable event hook
- Add function to test if master owns the bus
- Add function to test if master owns the bus
- Removed op_mode
- Changed parameter of i3c_master_get_accmst_locked, no need to
pass full i3c_device_info
- Changed name of mastership enable event hook
- Add function to test if master owns the bus
- Removed op_mode
- Changed parameter of i3c_master_get_accmst_locked, no need to
pass full i3c_device_info
- Removed redundant DEFSLVS command before GETACCMST
- Add i3c_master_bus_takeover function. There is a need to lock
the bus before adding devices and no matter of the controller
devices have to be added after mastership takeover.
- Add device registration during initialization on secondary master
side. Devices received by DEFSLVS (if occured). If not, device
initialization is deffered untill next mastership request.
---
 drivers/i3c/device.c       |  26 +++
 drivers/i3c/internals.h    |   4 +
 drivers/i3c/master.c       | 417 +++++++++++++++++++++++++++++++++++++--------
 include/linux/i3c/master.h |  17 ++
 4 files changed, 391 insertions(+), 73 deletions(-)

diff --git a/drivers/i3c/device.c b/drivers/i3c/device.c
index 69cc040..b60f637 100644
--- a/drivers/i3c/device.c
+++ b/drivers/i3c/device.c
@@ -43,7 +43,13 @@ int i3c_device_do_priv_xfers(struct i3c_device *dev,
 	}
 
 	i3c_bus_normaluse_lock(dev->bus);
+	ret = i3c_master_acquire_bus_ownership(dev->desc->common.master);
+	if (ret)
+		goto err_unlock_bus;
+
 	ret = i3c_dev_do_priv_xfers_locked(dev->desc, xfers, nxfers);
+
+err_unlock_bus:
 	i3c_bus_normaluse_unlock(dev->bus);
 
 	return ret;
@@ -114,11 +120,17 @@ int i3c_device_enable_ibi(struct i3c_device *dev)
 	int ret = -ENOENT;
 
 	i3c_bus_normaluse_lock(dev->bus);
+	ret = i3c_master_acquire_bus_ownership(dev->desc->common.master);
+	if (ret)
+		goto err_unlock_bus;
+
 	if (dev->desc) {
 		mutex_lock(&dev->desc->ibi_lock);
 		ret = i3c_dev_enable_ibi_locked(dev->desc);
 		mutex_unlock(&dev->desc->ibi_lock);
 	}
+
+err_unlock_bus:
 	i3c_bus_normaluse_unlock(dev->bus);
 
 	return ret;
@@ -145,11 +157,17 @@ int i3c_device_request_ibi(struct i3c_device *dev,
 		return -EINVAL;
 
 	i3c_bus_normaluse_lock(dev->bus);
+	ret = i3c_master_acquire_bus_ownership(dev->desc->common.master);
+	if (ret)
+		goto err_unlock_bus;
+
 	if (dev->desc) {
 		mutex_lock(&dev->desc->ibi_lock);
 		ret = i3c_dev_request_ibi_locked(dev->desc, req);
 		mutex_unlock(&dev->desc->ibi_lock);
 	}
+
+err_unlock_bus:
 	i3c_bus_normaluse_unlock(dev->bus);
 
 	return ret;
@@ -166,12 +184,20 @@ EXPORT_SYMBOL_GPL(i3c_device_request_ibi);
  */
 void i3c_device_free_ibi(struct i3c_device *dev)
 {
+	int ret;
+
 	i3c_bus_normaluse_lock(dev->bus);
+	ret = i3c_master_acquire_bus_ownership(dev->desc->common.master);
+	if (ret)
+		goto err_unlock_bus;
+
 	if (dev->desc) {
 		mutex_lock(&dev->desc->ibi_lock);
 		i3c_dev_free_ibi_locked(dev->desc);
 		mutex_unlock(&dev->desc->ibi_lock);
 	}
+
+err_unlock_bus:
 	i3c_bus_normaluse_unlock(dev->bus);
 }
 EXPORT_SYMBOL_GPL(i3c_device_free_ibi);
diff --git a/drivers/i3c/internals.h b/drivers/i3c/internals.h
index 86b7b44..929ca6b 100644
--- a/drivers/i3c/internals.h
+++ b/drivers/i3c/internals.h
@@ -14,6 +14,10 @@ extern struct bus_type i3c_bus_type;
 
 void i3c_bus_normaluse_lock(struct i3c_bus *bus);
 void i3c_bus_normaluse_unlock(struct i3c_bus *bus);
+void i3c_bus_downgrade_maintenance_lock(struct i3c_bus *bus);
+int i3c_master_acquire_bus_ownership(struct i3c_master_controller *master);
+int i3c_master_request_mastership_locked(struct i3c_master_controller *master);
+
 
 int i3c_dev_do_priv_xfers_locked(struct i3c_dev_desc *dev,
 				 struct i3c_priv_xfer *xfers,
diff --git a/drivers/i3c/master.c b/drivers/i3c/master.c
index aea4309..7a84158 100644
--- a/drivers/i3c/master.c
+++ b/drivers/i3c/master.c
@@ -93,6 +93,20 @@ void i3c_bus_normaluse_unlock(struct i3c_bus *bus)
 	up_read(&bus->lock);
 }
 
+/**
+ * i3c_bus_downgrade_maintenance_lock - Downgrade the bus lock to normal
+ * operation
+ * @bus: I3C bus to downgrade the lock on
+ *
+ * Should be called when a maintenance operation is done and normal
+ * operation is planned. See i3c_bus_maintenance_lock() and
+ * i3c_bus_normaluse_lock() for more details.
+ */
+void i3c_bus_downgrade_maintenance_lock(struct i3c_bus *bus)
+{
+	downgrade_write(&bus->lock);
+}
+
 static struct i3c_master_controller *dev_to_i3cmaster(struct device *dev)
 {
 	return container_of(dev, struct i3c_master_controller, dev);
@@ -341,6 +355,22 @@ static int i3c_device_probe(struct device *dev)
 	return driver->probe(i3cdev);
 }
 
+static void i3c_master_enable_mr_events(struct i3c_master_controller *master)
+{
+	if (!master->ops->enable_mr_events)
+		return;
+
+	master->ops->enable_mr_events(master);
+}
+
+static void i3c_master_disable_mr_events(struct i3c_master_controller *master)
+{
+	if (!master->ops->disable_mr_events)
+		return;
+
+	master->ops->disable_mr_events(master);
+}
+
 static int i3c_device_remove(struct device *dev)
 {
 	struct i3c_device *i3cdev = dev_to_i3cdev(dev);
@@ -462,6 +492,36 @@ static int i3c_bus_init(struct i3c_bus *i3cbus)
 	return 0;
 }
 
+int i3c_master_request_mastership_locked(struct i3c_master_controller *master)
+{
+	if (WARN_ON(master->init_done &&
+	    !rwsem_is_locked(&master->bus.lock)))
+		return -EINVAL;
+
+	if (!master->ops->request_mastership)
+		return -ENOTSUPP;
+
+	return master->ops->request_mastership(master);
+}
+
+int i3c_master_acquire_bus_ownership(struct i3c_master_controller *master)
+{
+	int ret;
+
+	if (master->bus.cur_master != master->this) {
+		i3c_bus_normaluse_unlock(&master->bus);
+		i3c_bus_maintenance_lock(&master->bus);
+
+		ret = i3c_master_request_mastership_locked(master);
+		if (ret) {
+			i3c_bus_maintenance_unlock(&master->bus);
+			return ret;
+		}
+		i3c_bus_downgrade_maintenance_lock(&master->bus);
+	}
+	return 0;
+}
+
 static const char * const i3c_bus_mode_strings[] = {
 	[I3C_BUS_MODE_PURE] = "pure",
 	[I3C_BUS_MODE_MIXED_FAST] = "mixed-fast",
@@ -620,6 +680,25 @@ i3c_master_alloc_i2c_dev(struct i3c_master_controller *master,
 
 	dev->common.master = master;
 	dev->boardinfo = boardinfo;
+	dev->addr = boardinfo->base.addr;
+	dev->lvr = boardinfo->lvr;
+
+	return dev;
+}
+
+static struct i2c_dev_desc *
+i3c_master_alloc_i2c_dev_no_boardinfo(struct i3c_master_controller *master,
+				      u16 addr, u8 lvr)
+{
+	struct i2c_dev_desc *dev;
+
+	dev = kzalloc(sizeof(*dev), GFP_KERNEL);
+	if (!dev)
+		return ERR_PTR(-ENOMEM);
+
+	dev->common.master = master;
+	dev->addr = addr;
+	dev->lvr = lvr;
 
 	return dev;
 }
@@ -693,6 +772,9 @@ i3c_master_find_i2c_dev_by_addr(const struct i3c_master_controller *master,
 	struct i2c_dev_desc *dev;
 
 	i3c_bus_for_each_i2cdev(&master->bus, dev) {
+		if (!dev->boardinfo)
+			continue;
+
 		if (dev->boardinfo->base.addr == addr)
 			return dev;
 	}
@@ -939,8 +1021,8 @@ int i3c_master_defslvs_locked(struct i3c_master_controller *master)
 
 	desc = defslvs->slaves;
 	i3c_bus_for_each_i2cdev(bus, i2cdev) {
-		desc->lvr = i2cdev->boardinfo->lvr;
-		desc->static_addr = i2cdev->boardinfo->base.addr << 1;
+		desc->lvr = i2cdev->lvr;
+		desc->static_addr = i2cdev->addr << 1;
 		desc++;
 	}
 
@@ -1492,6 +1574,83 @@ i3c_master_register_new_i3c_devs(struct i3c_master_controller *master)
 	}
 }
 
+static struct i2c_dev_boardinfo *
+i3c_master_find_i2c_boardinfo(const struct i3c_master_controller *master,
+			      u16 addr, u8 lvr)
+{
+	struct i2c_dev_boardinfo *i2cboardinfo;
+
+	list_for_each_entry(i2cboardinfo, &master->boardinfo.i2c, node) {
+		if (i2cboardinfo->base.addr == addr &&
+		    i2cboardinfo->lvr == lvr)
+			return i2cboardinfo;
+	}
+
+	return NULL;
+}
+
+static void
+i3c_master_register_new_i2c_devs(struct i3c_master_controller *master)
+{
+	struct i2c_adapter *adap = i3c_master_to_i2c_adapter(master);
+	struct i2c_dev_desc *i2cdev;
+
+	if (!master->init_done)
+		return;
+
+	i3c_bus_for_each_i2cdev(&master->bus, i2cdev) {
+		if (i2cdev->dev)
+			continue;
+
+		if (!i2cdev->boardinfo)
+			continue;
+
+		i2cdev->dev = i2c_new_device(adap, &i2cdev->boardinfo->base);
+	}
+}
+
+/**
+ * i3c_master_get_accmst_locked() - send a GETACCMST CCC command
+ * @master: master used to send frames on the bus
+ * @info: I3C device information
+ *
+ * Send a GETACCMST CCC command.
+ *
+ * This should be called if the curent master acknowledges bus takeover.
+ *
+ * This function must be called with the bus lock held in write mode.
+ *
+ * Return: 0 in case of success, a positive I3C error code if the error is
+ * one of the official Mx error codes, and a negative error code otherwise.
+ */
+int i3c_master_get_accmst_locked(struct i3c_master_controller *master,
+				 u8 addr)
+{
+	struct i3c_ccc_getaccmst *accmst;
+	struct i3c_ccc_cmd_dest dest;
+	struct i3c_ccc_cmd cmd;
+	int ret;
+
+	accmst = i3c_ccc_cmd_dest_init(&dest, addr, sizeof(*accmst));
+	if (!accmst)
+		return -ENOMEM;
+
+	i3c_ccc_cmd_init(&cmd, true, I3C_CCC_GETACCMST, &dest, 1);
+
+	ret = i3c_master_send_ccc_cmd_locked(master, &cmd);
+	if (ret)
+		goto out;
+
+	if (dest.payload.len != sizeof(*accmst))
+		ret = -EIO;
+
+out:
+	i3c_ccc_cmd_dest_cleanup(&dest);
+
+	return ret;
+}
+EXPORT_SYMBOL_GPL(i3c_master_get_accmst_locked);
+
 /**
  * i3c_master_do_daa() - do a DAA (Dynamic Address Assignment)
  * @master: master doing the DAA
@@ -1559,10 +1718,6 @@ int i3c_master_set_info(struct i3c_master_controller *master,
 	if (!i3c_bus_dev_addr_is_avail(&master->bus, info->dyn_addr))
 		return -EINVAL;
 
-	if (I3C_BCR_DEVICE_ROLE(info->bcr) == I3C_BCR_I3C_MASTER &&
-	    master->secondary)
-		return -EINVAL;
-
 	if (master->this)
 		return -EINVAL;
 
@@ -1607,43 +1762,13 @@ static void i3c_master_detach_free_devs(struct i3c_master_controller *master)
 				 common.node) {
 		i3c_master_detach_i2c_dev(i2cdev);
 		i3c_bus_set_addr_slot_status(&master->bus,
-					i2cdev->boardinfo->base.addr,
-					I3C_ADDR_SLOT_FREE);
+					     i2cdev->addr,
+					     I3C_ADDR_SLOT_FREE);
 		i3c_master_free_i2c_dev(i2cdev);
 	}
 }
 
-/**
- * i3c_master_bus_init() - initialize an I3C bus
- * @master: main master initializing the bus
- *
- * This function is following all initialisation steps described in the I3C
- * specification:
- *
- * 1. Attach I2C and statically defined I3C devs to the master so that the
- *    master can fill its internal device table appropriately
- *
- * 2. Call &i3c_master_controller_ops->bus_init() method to initialize
- *    the master controller. That's usually where the bus mode is selected
- *    (pure bus or mixed fast/slow bus)
- *
- * 3. Instruct all devices on the bus to drop their dynamic address. This is
- *    particularly important when the bus was previously configured by someone
- *    else (for example the bootloader)
- *
- * 4. Disable all slave events.
- *
- * 5. Pre-assign dynamic addresses requested by the FW with SETDASA for I3C
- *    devices that have a static address
- *
- * 6. Do a DAA (Dynamic Address Assignment) to assign dynamic addresses to all
- *    remaining I3C devices
- *
- * Once this is done, all I3C and I2C devices should be usable.
- *
- * Return: a 0 in case of success, an negative error code otherwise.
- */
-static int i3c_master_bus_init(struct i3c_master_controller *master)
+static int i3c_master_attach_static_devs(struct i3c_master_controller *master)
 {
 	enum i3c_addr_slot_status status;
 	struct i2c_dev_boardinfo *i2cboardinfo;
@@ -1652,32 +1777,24 @@ static int i3c_master_bus_init(struct i3c_master_controller *master)
 	struct i2c_dev_desc *i2cdev;
 	int ret;
 
-	/*
-	 * First attach all devices with static definitions provided by the
-	 * FW.
-	 */
 	list_for_each_entry(i2cboardinfo, &master->boardinfo.i2c, node) {
 		status = i3c_bus_get_addr_slot_status(&master->bus,
 						      i2cboardinfo->base.addr);
-		if (status != I3C_ADDR_SLOT_FREE) {
-			ret = -EBUSY;
-			goto err_detach_devs;
-		}
+		if (status != I3C_ADDR_SLOT_FREE)
+			return -EBUSY;
 
 		i3c_bus_set_addr_slot_status(&master->bus,
 					     i2cboardinfo->base.addr,
 					     I3C_ADDR_SLOT_I2C_DEV);
 
 		i2cdev = i3c_master_alloc_i2c_dev(master, i2cboardinfo);
-		if (IS_ERR(i2cdev)) {
-			ret = PTR_ERR(i2cdev);
-			goto err_detach_devs;
-		}
+		if (IS_ERR(i2cdev))
+			return PTR_ERR(i2cdev);
 
 		ret = i3c_master_attach_i2c_dev(master, i2cdev);
 		if (ret) {
 			i3c_master_free_i2c_dev(i2cdev);
-			goto err_detach_devs;
+			return ret;
 		}
 	}
 	list_for_each_entry(i3cboardinfo, &master->boardinfo.i3c, node) {
@@ -1687,28 +1804,71 @@ static int i3c_master_bus_init(struct i3c_master_controller *master)
 
 		if (i3cboardinfo->init_dyn_addr) {
 			status = i3c_bus_get_addr_slot_status(&master->bus,
-						i3cboardinfo->init_dyn_addr);
-			if (status != I3C_ADDR_SLOT_FREE) {
-				ret = -EBUSY;
-				goto err_detach_devs;
-			}
+							      i3cboardinfo->init_dyn_addr);
+			if (status != I3C_ADDR_SLOT_FREE)
+				return -EBUSY;
 		}
 
 		i3cdev = i3c_master_alloc_i3c_dev(master, &info);
-		if (IS_ERR(i3cdev)) {
-			ret = PTR_ERR(i3cdev);
-			goto err_detach_devs;
-		}
+		if (IS_ERR(i3cdev))
+			return PTR_ERR(i3cdev);
 
 		i3cdev->boardinfo = i3cboardinfo;
 
 		ret = i3c_master_attach_i3c_dev(master, i3cdev);
 		if (ret) {
 			i3c_master_free_i3c_dev(i3cdev);
-			goto err_detach_devs;
+			return ret;
 		}
 	}
 
+	return 0;
+}
+
+/**
+ * i3c_master_bus_init() - initialize an I3C bus
+ * @master: main master initializing the bus
+ *
+ * This function is following all initialisation steps described in the I3C
+ * specification:
+ *
+ * 1. Attach I2C and statically defined I3C devs to the master so that the
+ *    master can fill its internal device table appropriately
+ *
+ * 2. Call &i3c_master_controller_ops->bus_init() method to initialize
+ *    the master controller. That's usually where the bus mode is selected
+ *    (pure bus or mixed fast/slow bus)
+ *
+ * 3. Instruct all devices on the bus to drop their dynamic address. This is
+ *    particularly important when the bus was previously configured by someone
+ *    else (for example the bootloader)
+ *
+ * 4. Disable all slave events.
+ *
+ * 5. Pre-assign dynamic addresses requested by the FW with SETDASA for I3C
+ *    devices that have a static address
+ *
+ * 6. Do a DAA (Dynamic Address Assignment) to assign dynamic addresses to all
+ *    remaining I3C devices
+ *
+ * Once this is done, all I3C and I2C devices should be usable.
+ *
+ * Return: a 0 in case of success, an negative error code otherwise.
+ */
+static int i3c_master_bus_init(struct i3c_master_controller *master)
+{
+	struct i3c_dev_desc *i3cdev;
+	int ret;
+
+	/*
+	 * First attach all devices with static definitions provided by the
+	 * FW.
+	 */
+	if (!master->secondary) {
+		ret = i3c_master_attach_static_devs(master);
+		if (ret)
+			goto err_detach_devs;
+	}
 	/*
 	 * Now execute the controller specific ->bus_init() routine, which
 	 * might configure its internal logic to match the bus limitations.
@@ -1729,6 +1889,13 @@ static int i3c_master_bus_init(struct i3c_master_controller *master)
 	}
 
 	/*
+	 * Don't reset addresses if this is secondary master.
+	 * Secondary masters can't do DAA.
+	 */
+	if (master->secondary)
+		return 0;
+
+	/*
 	 * Reset all dynamic address that may have been assigned before
 	 * (assigned by the bootloader for example).
 	 */
@@ -1791,6 +1958,49 @@ i3c_master_search_i3c_dev_duplicate(struct i3c_dev_desc *refdev)
 	return NULL;
 }
 
+int i3c_master_add_i2c_dev(struct i3c_master_controller *master,
+			   u16 addr, u8 lvr)
+{
+	enum i3c_addr_slot_status status;
+	struct i2c_dev_desc *i2cdev;
+	int ret;
+
+	if (!master)
+		return -EINVAL;
+
+	status = i3c_bus_get_addr_slot_status(&master->bus,
+					      addr);
+	if (status != I3C_ADDR_SLOT_FREE)
+		return -EBUSY;
+
+	i3c_bus_set_addr_slot_status(&master->bus, addr,
+				     I3C_ADDR_SLOT_I2C_DEV);
+
+	i2cdev = i3c_master_alloc_i2c_dev_no_boardinfo(master, addr, lvr);
+	if (IS_ERR(i2cdev)) {
+		ret = PTR_ERR(i2cdev);
+		goto err_free_dev;
+	}
+
+	i2cdev->boardinfo = i3c_master_find_i2c_boardinfo(master, addr, lvr);
+
+	ret = i3c_master_attach_i2c_dev(master, i2cdev);
+	if (ret) {
+		ret = PTR_ERR(i2cdev);
+		goto err_free_dev;
+	}
+
+	return 0;
+
+err_free_dev:
+	i3c_bus_set_addr_slot_status(&master->bus, addr,
+				     I3C_ADDR_SLOT_FREE);
+	i3c_master_free_i2c_dev(i2cdev);
+
+	return ret;
+}
+EXPORT_SYMBOL_GPL(i3c_master_add_i2c_dev);
+
 /**
  * i3c_master_add_i3c_dev_locked() - add an I3C slave to the bus
  * @master: master used to send frames on the bus
@@ -2113,11 +2323,17 @@ static int i3c_master_i2c_adapter_xfer(struct i2c_adapter *adap,
 	}
 
 	i3c_bus_normaluse_lock(&master->bus);
+	ret = i3c_master_acquire_bus_ownership(master);
+	if (ret)
+		goto err_unlock_bus;
+
 	dev = i3c_master_find_i2c_dev_by_addr(master, addr);
 	if (!dev)
 		ret = -ENOENT;
 	else
 		ret = master->ops->i2c_xfers(dev, xfers, nxfers);
+
+err_unlock_bus:
 	i3c_bus_normaluse_unlock(&master->bus);
 
 	return ret ? ret : nxfers;
@@ -2151,8 +2367,12 @@ static int i3c_master_i2c_adapter_init(struct i3c_master_controller *master)
 	 * We silently ignore failures here. The bus should keep working
 	 * correctly even if one or more i2c devices are not registered.
 	 */
-	i3c_bus_for_each_i2cdev(&master->bus, i2cdev)
+	i3c_bus_for_each_i2cdev(&master->bus, i2cdev) {
+		if (!i2cdev->boardinfo)
+			continue;
+
 		i2cdev->dev = i2c_new_device(adap, &i2cdev->boardinfo->base);
+	}
 
 	return 0;
 }
@@ -2393,18 +2613,43 @@ static int i3c_master_check_ops(const struct i3c_master_controller_ops *ops)
 	     !ops->recycle_ibi_slot))
 		return -EINVAL;
 
+	if (ops->request_mastership &&
+	    (!ops->enable_mr_events || !ops->disable_mr_events))
+		return -EINVAL;
+
 	return 0;
 }
 
 /**
+ * i3c_master_register_new_devs() - register new devices
+ * @master: master used to send frames on the bus
+ *
+ * This function is useful when devices were not added
+ * during initialization or when new device joined the bus
+ * which was under control of different master.
+ */
+void i3c_master_register_new_devs(struct i3c_master_controller *master)
+{
+	/*
+	 * We can register I3C devices received from master by DEFSLVS.
+	 */
+	i3c_bus_normaluse_lock(&master->bus);
+	i3c_master_register_new_i3c_devs(master);
+	i3c_bus_normaluse_unlock(&master->bus);
+
+	i3c_bus_normaluse_lock(&master->bus);
+	i3c_master_register_new_i2c_devs(master);
+	i3c_bus_normaluse_unlock(&master->bus);
+}
+EXPORT_SYMBOL_GPL(i3c_master_register_new_devs);
+
+/**
  * i3c_master_register() - register an I3C master
  * @master: master used to send frames on the bus
  * @parent: the parent device (the one that provides this I3C master
  *	    controller)
  * @ops: the master controller operations
- * @secondary: true if you are registering a secondary master. Will return
- *	       -ENOTSUPP if set to true since secondary masters are not yet
- *	       supported
+ * @secondary: true if you are registering a secondary master.
  *
  * This function takes care of everything for you:
  *
@@ -2427,10 +2672,6 @@ int i3c_master_register(struct i3c_master_controller *master,
 	struct i2c_dev_boardinfo *i2cbi;
 	int ret;
 
-	/* We do not support secondary masters yet. */
-	if (secondary)
-		return -ENOTSUPP;
-
 	ret = i3c_master_check_ops(ops);
 	if (ret)
 		return ret;
@@ -2504,9 +2745,11 @@ int i3c_master_register(struct i3c_master_controller *master,
 	 * register I3C devices dicovered during the initial DAA.
 	 */
 	master->init_done = true;
-	i3c_bus_normaluse_lock(&master->bus);
-	i3c_master_register_new_i3c_devs(master);
-	i3c_bus_normaluse_unlock(&master->bus);
+	i3c_master_register_new_devs(master);
+
+	i3c_bus_maintenance_lock(&master->bus);
+	i3c_master_enable_mr_events(master);
+	i3c_bus_maintenance_unlock(&master->bus);
 
 	return 0;
 
@@ -2524,6 +2767,30 @@ int i3c_master_register(struct i3c_master_controller *master,
 EXPORT_SYMBOL_GPL(i3c_master_register);
 
 /**
+ * i3c_master_mastership_ack() - performs operations before bus handover.
+ * @master: master used to send frames on the bus
+ * @addr: I3C device address
+ *
+ * Basically, it sends DEFSLVS command to ensure new master is taking
+ * the bus with complete list of devices and then acknowledges bus takeover.
+ *
+ * Return: 0 in case of success, a negative error code otherwise.
+ */
+int i3c_master_mastership_ack(struct i3c_master_controller *master,
+			      u8 addr)
+{
+	int ret;
+
+	i3c_bus_maintenance_lock(&master->bus);
+	ret = i3c_master_get_accmst_locked(master, addr);
+	i3c_bus_maintenance_unlock(&master->bus);
+
+	return ret;
+}
+EXPORT_SYMBOL_GPL(i3c_master_mastership_ack);
+
+
+/**
  * i3c_master_unregister() - unregister an I3C master
  * @master: master used to send frames on the bus
  *
@@ -2533,6 +2800,10 @@ EXPORT_SYMBOL_GPL(i3c_master_register);
  */
 int i3c_master_unregister(struct i3c_master_controller *master)
 {
+	i3c_bus_maintenance_lock(&master->bus);
+	i3c_master_disable_mr_events(master);
+	i3c_bus_maintenance_unlock(&master->bus);
+
 	i3c_master_i2c_adapter_cleanup(master);
 	i3c_master_unregister_i3c_devs(master);
 	i3c_master_bus_cleanup(master);
diff --git a/include/linux/i3c/master.h b/include/linux/i3c/master.h
index 42bb215..f32afd3 100644
--- a/include/linux/i3c/master.h
+++ b/include/linux/i3c/master.h
@@ -421,6 +421,12 @@ struct i3c_bus {
  *		      for a future IBI
  *		      This method is mandatory only if ->request_ibi is not
  *		      NULL.
+ * @request_mastership: requests bus mastership. Mastership is requested
+ *                      automatically when device driver wants to transfer
+ *                      data using master in slave mode.
+ * @enable_mr_events: enable the Mastership event.
+ *                    Mastership does not require handler.
+ * @disable_mr_events: disable the Mastership event.
  */
 struct i3c_master_controller_ops {
 	int (*bus_init)(struct i3c_master_controller *master);
@@ -447,6 +453,10 @@ struct i3c_master_controller_ops {
 	int (*disable_ibi)(struct i3c_dev_desc *dev);
 	void (*recycle_ibi_slot)(struct i3c_dev_desc *dev,
 				 struct i3c_ibi_slot *slot);
+	void (*update_devs)(struct i3c_master_controller *master);
+	int (*request_mastership)(struct i3c_master_controller *master);
+	int (*enable_mr_events)(struct i3c_master_controller *master);
+	int (*disable_mr_events)(struct i3c_master_controller *master);
 };
 
 /**
@@ -526,6 +536,8 @@ int i3c_master_defslvs_locked(struct i3c_master_controller *master);
 int i3c_master_get_free_addr(struct i3c_master_controller *master,
 			     u8 start_addr);
 
+int i3c_master_add_i2c_dev(struct i3c_master_controller *master,
+			   u16 addr, u8 lvr);
 int i3c_master_add_i3c_dev_locked(struct i3c_master_controller *master,
 				  u8 addr);
 int i3c_master_do_daa(struct i3c_master_controller *master);
@@ -538,6 +550,11 @@ int i3c_master_register(struct i3c_master_controller *master,
 			const struct i3c_master_controller_ops *ops,
 			bool secondary);
 int i3c_master_unregister(struct i3c_master_controller *master);
+int i3c_master_get_accmst_locked(struct i3c_master_controller *master,
+				 u8 addr);
+int i3c_master_mastership_ack(struct i3c_master_controller *master,
+			      u8 addr);
+void i3c_master_register_new_devs(struct i3c_master_controller *master);
 
 /**
  * i3c_dev_get_master_data() - get master private data attached to an I3C
-- 
2.8.3


_______________________________________________
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
