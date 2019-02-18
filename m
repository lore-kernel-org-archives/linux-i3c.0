Return-Path: <SRS0=nyfO=QZ=lists.infradead.org=linux-i3c-bounces+linux-i3c=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=BAD_ENC_HEADER,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C7A0C43381
	for <linux-i3c@archiver.kernel.org>; Mon, 18 Feb 2019 13:13:13 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5C57D217F9
	for <linux-i3c@archiver.kernel.org>; Mon, 18 Feb 2019 13:13:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="XpyWmDMO";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=cadence.com header.i=@cadence.com header.b="NT2WaZ4a";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=cadence.com header.i=@cadence.com header.b="ilrjk6i/"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5C57D217F9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=cadence.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CLar5FQlJL+tRMsRJ4K9DLmiYg1ctpgAlMUmH76FXj4=; b=XpyWmDMO8uKHhl
	f2q7pjVT5RZGRQSegF5DR8e7Uvk+X7VM2TNLCUlqYswVQ4bUWhDGWdDEBuxwN4+zVEbO9b312glCg
	7+tVNLDxV0LZnaFG7zepCwJNj94KQRyeOMBlnGiXgnXXZizcAirnEvPRr4z6/MJyY6gbnrff+633C
	pLWsCrmcFTdmcBXrqV+V3XfCl7Ec1CNyXbtGYKv1Bmw/Gas81o4xwhRT4UkKaXQJpoB4M4LwOa4Dk
	yY9aKX4XScZ2pPB67Pf07XkqgGkcieX7ff8M9HQU4jY4W1JUEEv3egb1Fwz8IAf0/ETgOv1DWtvrK
	V5Q5gOilC/aDxuKqjmxA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gvijR-0001b4-0M; Mon, 18 Feb 2019 13:13:13 +0000
Received: from mx0b-0014ca01.pphosted.com ([208.86.201.193]
 helo=mx0a-0014ca01.pphosted.com)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gvijL-0001YN-9l
 for linux-i3c@lists.infradead.org; Mon, 18 Feb 2019 13:13:11 +0000
Received: from pps.filterd (m0042333.ppops.net [127.0.0.1])
 by mx0b-0014ca01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x1ID4awe008411; Mon, 18 Feb 2019 05:13:04 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cadence.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=proofpoint;
 bh=fPawqUPswejoHkGP5awI4YUZMjj8V8Ca9OmcYB9LF6U=;
 b=NT2WaZ4aEhf61PTcZcsZS0ALswbCuEk2jCFrlvkZBN1/ZI75vlCT6KxjZqo6BzHwEJMB
 ZmoDpNT3/1G98pDnD3SNMM+lZbbPDlNMJwivE1GNXdkIirDmgHEb2uVPt4n9Icwg24Na
 4FtuhJOWlmnKsZ0QKXzBWEHUCUe+8M8mEjXcnM4P8f0KTMz9Iqfg7grd03/yrYB7bbdh
 kEWdNP//UCMKThZyquo73cM+np0X/RMcX5xcrxSd0VkevPuiKXBJV0b7Ke+u12vSLP5+
 YratLzJttJOZqiYtPqCiA13x1Y1Gqwxo872PQckEnZ94EqRv9uVcqEuRcsMGdVir9q6h hA== 
Authentication-Results: cadence.com;
	spf=pass smtp.mailfrom=pgaj@cadence.com
Received: from nam04-co1-obe.outbound.protection.outlook.com
 (mail-co1nam04lp2056.outbound.protection.outlook.com [104.47.45.56])
 by mx0b-0014ca01.pphosted.com with ESMTP id 2qpeyy8uag-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT);
 Mon, 18 Feb 2019 05:13:03 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cadence.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fPawqUPswejoHkGP5awI4YUZMjj8V8Ca9OmcYB9LF6U=;
 b=ilrjk6i/Ojr2moG1G4PjSEFwMxKSlG/IbB9M0fE9U6eTWbJ354v/2529pqPB+cn9Fvaa90XlclR3M7efwuV1eGzGVhCBsL9wNCNm9er9LyA0Cw0Q33NDLkJUdjwgAkrj00iebY2V7meAx+Nerby9PMvyiGH+w+jmf7ljFlUpkoU=
Received: from DM5PR07CA0066.namprd07.prod.outlook.com (52.132.135.159) by
 SN1PR07MB2254.namprd07.prod.outlook.com (10.164.47.148) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1622.16; Mon, 18 Feb 2019 13:13:00 +0000
Received: from DM3NAM05FT040.eop-nam05.prod.protection.outlook.com
 (2a01:111:f400:7e51::203) by DM5PR07CA0066.outlook.office365.com
 (2603:10b6:4:ad::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.1622.16 via Frontend
 Transport; Mon, 18 Feb 2019 13:13:00 +0000
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 cadence.com discourages use of 158.140.1.28 as permitted sender)
Received: from sjmaillnx1.cadence.com (158.140.1.28) by
 DM3NAM05FT040.mail.protection.outlook.com (10.152.98.154) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1643.11 via Frontend Transport; Mon, 18 Feb 2019 13:12:59 +0000
Received: from maileu3.global.cadence.com (maileu3.cadence.com [10.160.88.99])
 by sjmaillnx1.cadence.com (8.14.4/8.14.4) with ESMTP id
 x1IDCuZ6019867
 (version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=OK);
 Mon, 18 Feb 2019 05:12:58 -0800
X-CrossPremisesHeadersFilteredBySendConnector: maileu3.global.cadence.com
Received: from maileu3.global.cadence.com (10.160.88.99) by
 maileu3.global.cadence.com (10.160.88.99) with Microsoft SMTP Server (TLS) id
 15.0.1367.3; Mon, 18 Feb 2019 14:12:50 +0100
Received: from lvlogina.cadence.com (10.165.176.102) by
 maileu3.global.cadence.com (10.160.88.99) with Microsoft SMTP Server (TLS) id
 15.0.1367.3 via Frontend Transport; Mon, 18 Feb 2019 14:12:50 +0100
Received: from lvlogina.cadence.com (localhost.localdomain [127.0.0.1])
 by lvlogina.cadence.com (8.14.4/8.14.4) with ESMTP id x1IDCo1O000861;
 Mon, 18 Feb 2019 13:12:50 GMT
Received: (from pgaj@localhost)
 by lvlogina.cadence.com (8.14.4/8.14.4/Submit) id x1IDCobd000856;
 Mon, 18 Feb 2019 13:12:50 GMT
From: Przemyslaw Gaj <pgaj@cadence.com>
To: <bbrezillon@kernel.org>
Subject: [PATCH 1/4] i3c: Add support for mastership request to I3C subsystem
Date: Mon, 18 Feb 2019 13:08:43 +0000
Message-ID: <20190218130846.19939-2-pgaj@cadence.com>
X-Mailer: git-send-email 2.8.3
In-Reply-To: <20190218130846.19939-1-pgaj@cadence.com>
References: <20190218130846.19939-1-pgaj@cadence.com>
MIME-Version: 1.0
X-OrganizationHeadersPreserved: maileu3.global.cadence.com
X-EOPAttributedMessage: 0
X-Forefront-Antispam-Report: CIP:158.140.1.28; IPV:CAL; SCL:-1; CTRY:US;
 EFV:NLI; SFV:NSPM;
 SFS:(10009020)(346002)(39860400002)(376002)(396003)(136003)(2980300002)(189003)(199004)(36092001)(105596002)(7636002)(4326008)(5660300002)(26826003)(478600001)(107886003)(2906002)(305945005)(87636003)(36756003)(50466002)(47776003)(1076003)(106466001)(2351001)(48376002)(246002)(16586007)(316002)(42186006)(54906003)(186003)(336012)(6916009)(356004)(8936002)(30864003)(6666004)(476003)(426003)(486006)(2616005)(126002)(446003)(11346002)(50226002)(8676002)(86362001)(51416003)(76176011)(14444005)(5024004)(26005);
 DIR:OUT; SFP:1101; SCL:1; SRVR:SN1PR07MB2254; H:sjmaillnx1.cadence.com; FPR:;
 SPF:SoftFail; LANG:en; PTR:corp.cadence.com; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 85c57527-05d2-4661-d62e-08d695a2ce5f
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600110)(711020)(4605104)(2017052603328)(7153060);
 SRVR:SN1PR07MB2254; 
X-MS-TrafficTypeDiagnostic: SN1PR07MB2254:
X-Microsoft-Exchange-Diagnostics: 1; SN1PR07MB2254;
 20:A1LshlFEXQwcgcFLpSOrECApsFqM1LnlO9iTUoYf5/zUlZmghOcCaV8sKxYYXVd1XsjDqj8gUisyphEc4R+5JXYp9BtDhMCM9hn5z9ZNrctmrf5GRPD8wW+7wWktNqblqvdbCJ6ZOFkah+PmuAfr6eR6WujPJV93uUPhyoi+QpbyvrH+EQ7/wrJLZp8c3losp1glrsEFLObB1oCEgdVO38ShhOtpmoTj1DcRwoCMpnCcjhCxqiB7cA7Sycr9tL3GZcFH1NS2rvAdWPvlWx/AFyCkYjRjz6DmQsIPA3vrM7F5GvPMa6qcUw7WkzhgPjYXyQaFs8Y/jXwQXDcwQ7C9DWn29NHZuCHDNiHLP9KcJ20vH4iPpAx1Nx3lNbSxuh6rQNwUbfAA9KGg2VcM6bx58zQ3XEbpcgEQyD3CJGviyKQEW7NhisIOIInaC4ZwyoNnJo9a8K03gcKKELtyIccl4bWE8EZPVCvKa54PR54umezuSwpLN1zT9R1VgWXoYPjR
X-Microsoft-Antispam-PRVS: <SN1PR07MB225422DEE15F6FB847A03B24C2630@SN1PR07MB2254.namprd07.prod.outlook.com>
X-Forefront-PRVS: 09525C61DB
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; SN1PR07MB2254;
 23:iDUqT7ewoyYU7+jrFlYYwthQ2bJ0Cn5n2mzuYKT8f?=
 =?us-ascii?Q?S6qITD7YU8+CYFGbT4cs/EGM8A6mbCFT0/H5aY2p4BWJQtuN9F8hALrJXHvJ?=
 =?us-ascii?Q?Jxl2Y3xSgGBFYGj3lyajmEIQmYtoFOkZsbiCGVsVBCo86ngHR+rdbgSMLWnO?=
 =?us-ascii?Q?ry3/Pp64eDlkyFXUJIexHlKFi+dJ9RwQITlt4JU9oe95p8cJKvcUklAvEfxq?=
 =?us-ascii?Q?0/E8UgtdbSMcOzSkdDtF1X3448YvGvEopi2HxClFJGEXlEkb9JqHPqTfU8gp?=
 =?us-ascii?Q?yooWRCWOBm8/jgCeSIjcLuznC2n87xgWuOhHyhdoXZsTcdCTpz0ams6hIHhd?=
 =?us-ascii?Q?jDd7wMQlOjyFcwod4wm3MTPUPKZf7Vkb6NAZml/NAuAzH71X/dtLNtPS4QrD?=
 =?us-ascii?Q?FY9c5oUILAFJ0yqXxWy/Bwz4YgKDk+V717V+8IHkMyhYutfpuQWCquj/4nCe?=
 =?us-ascii?Q?nNH8EZQ1gZVtFrNe9LV0UWm3ltGzHOOBHh3fMphY0iIDfCcjoWGoPk7Bav9l?=
 =?us-ascii?Q?wCTL5qa8q/498IGjfXYrOleshGXkHxwuJJF/FrwZZmX0JYR72NxF1FFT2pRz?=
 =?us-ascii?Q?StbBo5RDeUNxJpFvDBJF11Jo7Eg7/n8MJSj+X/8CXYQJ3a/oK2MT5/HahiZe?=
 =?us-ascii?Q?PR4IqBgsWOdM2ZsvleujJGZN6s75xWmcOQDe+HLJuOvZwlkNv4U5L+DPzqCn?=
 =?us-ascii?Q?wHyQ72o7+u7XN+7T23N2Yw/N4sxBXdshgMRW5Tr/sXBVV9R8lF5QoN7VTt2I?=
 =?us-ascii?Q?rU5qCgC+SCSbkGGf2Mp1eIbq1LMRYoGBEdsWzCzKYnv22pvaC71iB4Eibd3a?=
 =?us-ascii?Q?FrqmF2DHq9laD06VRVXjn8TSXjOVIMjC0LHFFMEf5woFLR2L/lub5cRHR6ll?=
 =?us-ascii?Q?7t0C66i3KzCFXytfuF3rHczRYu2GoO+UrLdNbXhO2Ysg/hmIaKYb3W+2UXDt?=
 =?us-ascii?Q?nPB6QCHya7gm++LBlyTo7pnR4V01GaEwvVukntGZ0lVnuK5kBNbJ8URdueG/?=
 =?us-ascii?Q?C6o7uQ/JG+RSmj+267sGtZIPTkz0agE1OgDYP+n6yWdZ4zTwoqdSG3/2g9Ev?=
 =?us-ascii?Q?TsCbvyea6ky1zHN6/b1umh3SlFkvkXAJi4Rbd/U4gONvZli2YIZdSC4tgjg1?=
 =?us-ascii?Q?EKuwA6HSIbQXHd3kUVmjUPfn6kdvZ4+oceg3jh2qtRLsz8yQeShig=3D=3D?=
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: H50xK7vxR6SHU3iXyxqrVuw5S6hNKh3Bun+CYOVYCVhzWKpQ8OgGirqjPvEfr/8Mo+68disIMHomogtS28lz7VN1UdP2429ZXT2925cAR8oQSZqmrWL4dTQbbSJrdvZKUfRac9LlL5W20VTQ96m1DyXxUDQE2F7OmLbOf8Mw1t3eRHa92Wde6Uga8K3S+2iNAHsrl7v/7Kn5dnAdRmkO2C1vnWYTugVjt/24IGGosyeR7e6T1GuYI+e83Ndq2RXjBC3TIh6tmtS6BY9E9D80PlZItoigvtFuuWlopN/WJvjEtpEFXIalfHjYAdH8IEFbpPPlxZXcmVsSdF91VXJ+kYIMKDloXANaYozNtcowCH1v+XieUHdbYNfgR7fTRLCwfV7n0+GQUZxCingIiF2QiJJqQa8le+JrLpfALzZr7RY=
X-Microsoft-Exchange-Diagnostics: 1; SN1PR07MB2254;
 20:4nGXHYbX0IMao9VCzP3VOyFBK2vpKBwrs+JBQs2psCHNlAQH62czjB7x1sQrO3tdkksu+fLoqiFSi+g72QhM31HjxBIYilrZKU1LjE+cVWcLDH4CT2kMaL5FJeZgnFPXQVtkuUL3dNH0O/Ui8Rheaq6FB6fR6MlU4ZAqLWaR4EHwChOtatC6j5ncdWxUBxTPRVHJFvlui0PMK9RkhTwDOdGJQp5jad5Av0Pj06bFRZcmJZaV76zCypGbcooTlOAk
X-OriginatorOrg: cadence.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Feb 2019 13:12:59.5715 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 85c57527-05d2-4661-d62e-08d695a2ce5f
X-MS-Exchange-CrossTenant-Id: d36035c5-6ce6-4662-a3dc-e762e61ae4c9
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=d36035c5-6ce6-4662-a3dc-e762e61ae4c9; Ip=[158.140.1.28];
 Helo=[sjmaillnx1.cadence.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN1PR07MB2254
X-Proofpoint-SPF-Result: pass
X-Proofpoint-SPF-Record: v=spf1 include:_spf.salesforce.com
 include:mktomail.com
 include:spf-0014ca01.pphosted.com include:spf.protection.outlook.com
 include:auth.msgapp.com include:spf.mandrillapp.com ~all
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-02-18_10:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_check_notspam policy=outbound_check
 score=0
 priorityscore=1501 malwarescore=0 suspectscore=3 phishscore=0 bulkscore=0
 spamscore=0 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1902180099
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190218_051307_726494_CC06BC4B 
X-CRM114-Status: GOOD (  15.18  )
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

This patch adds support for mastership request to I3C subsystem.

Mastership event is enabled globally.

Mastership is requested automatically when device driver
tries to transfer data using master controller in slave mode.

There is still some limitation:
- I2C devices are registered on secondary master side if boardinfo
entry matching the info transmitted through the DEFSLVS frame.

Signed-off-by: Przemyslaw Gaj <pgaj@cadence.com>

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
 drivers/i3c/device.c       |  47 +++++
 drivers/i3c/internals.h    |   4 +
 drivers/i3c/master.c       | 428 +++++++++++++++++++++++++++++++++++++--------
 include/linux/i3c/master.h |  22 +++
 4 files changed, 427 insertions(+), 74 deletions(-)

diff --git a/drivers/i3c/device.c b/drivers/i3c/device.c
index 69cc040..f53d689 100644
--- a/drivers/i3c/device.c
+++ b/drivers/i3c/device.c
@@ -43,6 +43,17 @@ int i3c_device_do_priv_xfers(struct i3c_device *dev,
 	}
 
 	i3c_bus_normaluse_lock(dev->bus);
+	if (!i3c_master_owns_bus_locked(dev->desc->common.master)) {
+		i3c_bus_normaluse_unlock(dev->bus);
+		i3c_bus_maintenance_lock(dev->bus);
+		ret = i3c_master_request_mastership_locked(dev->desc->common.master);
+		if (ret) {
+			i3c_bus_maintenance_unlock(dev->bus);
+			return ret;
+		}
+		i3c_bus_downgrade_maintenance_lock(dev->bus);
+	}
+
 	ret = i3c_dev_do_priv_xfers_locked(dev->desc, xfers, nxfers);
 	i3c_bus_normaluse_unlock(dev->bus);
 
@@ -114,6 +125,17 @@ int i3c_device_enable_ibi(struct i3c_device *dev)
 	int ret = -ENOENT;
 
 	i3c_bus_normaluse_lock(dev->bus);
+	if (!i3c_master_owns_bus_locked(dev->desc->common.master)) {
+		i3c_bus_normaluse_unlock(dev->bus);
+		i3c_bus_maintenance_lock(dev->bus);
+		ret = i3c_master_request_mastership_locked(dev->desc->common.master);
+		if (ret) {
+			i3c_bus_maintenance_unlock(dev->bus);
+			return ret;
+		}
+		i3c_bus_downgrade_maintenance_lock(dev->bus);
+	}
+
 	if (dev->desc) {
 		mutex_lock(&dev->desc->ibi_lock);
 		ret = i3c_dev_enable_ibi_locked(dev->desc);
@@ -145,6 +167,18 @@ int i3c_device_request_ibi(struct i3c_device *dev,
 		return -EINVAL;
 
 	i3c_bus_normaluse_lock(dev->bus);
+
+	if (!i3c_master_owns_bus_locked(dev->desc->common.master)) {
+		i3c_bus_normaluse_unlock(dev->bus);
+		i3c_bus_maintenance_lock(dev->bus);
+		ret = i3c_master_request_mastership_locked(dev->desc->common.master);
+		if (ret) {
+			i3c_bus_maintenance_unlock(dev->bus);
+			return ret;
+		}
+		i3c_bus_downgrade_maintenance_lock(dev->bus);
+	}
+
 	if (dev->desc) {
 		mutex_lock(&dev->desc->ibi_lock);
 		ret = i3c_dev_request_ibi_locked(dev->desc, req);
@@ -166,7 +200,20 @@ EXPORT_SYMBOL_GPL(i3c_device_request_ibi);
  */
 void i3c_device_free_ibi(struct i3c_device *dev)
 {
+	int ret;
+
 	i3c_bus_normaluse_lock(dev->bus);
+	if (!i3c_master_owns_bus_locked(dev->desc->common.master)) {
+		i3c_bus_normaluse_unlock(dev->bus);
+		i3c_bus_maintenance_lock(dev->bus);
+		ret = i3c_master_request_mastership_locked(dev->desc->common.master);
+		if (ret) {
+			i3c_bus_maintenance_unlock(dev->bus);
+			return;
+		}
+		i3c_bus_downgrade_maintenance_lock(dev->bus);
+	}
+
 	if (dev->desc) {
 		mutex_lock(&dev->desc->ibi_lock);
 		i3c_dev_free_ibi_locked(dev->desc);
diff --git a/drivers/i3c/internals.h b/drivers/i3c/internals.h
index 86b7b44..7e9f1fb 100644
--- a/drivers/i3c/internals.h
+++ b/drivers/i3c/internals.h
@@ -14,6 +14,10 @@ extern struct bus_type i3c_bus_type;
 
 void i3c_bus_normaluse_lock(struct i3c_bus *bus);
 void i3c_bus_normaluse_unlock(struct i3c_bus *bus);
+void i3c_bus_downgrade_maintenance_lock(struct i3c_bus *bus);
+bool i3c_master_owns_bus_locked(struct i3c_master_controller *master);
+int i3c_master_request_mastership_locked(struct i3c_master_controller *master);
+
 
 int i3c_dev_do_priv_xfers_locked(struct i3c_dev_desc *dev,
 				 struct i3c_priv_xfer *xfers,
diff --git a/drivers/i3c/master.c b/drivers/i3c/master.c
index 2dc628d..14493e5 100644
--- a/drivers/i3c/master.c
+++ b/drivers/i3c/master.c
@@ -38,10 +38,11 @@ static DEFINE_MUTEX(i3c_core_lock);
  * logic to rely on I3C device information that could be changed behind their
  * back.
  */
-static void i3c_bus_maintenance_lock(struct i3c_bus *bus)
+void i3c_bus_maintenance_lock(struct i3c_bus *bus)
 {
 	down_write(&bus->lock);
 }
+EXPORT_SYMBOL_GPL(i3c_bus_maintenance_lock);
 
 /**
  * i3c_bus_maintenance_unlock - Release the bus lock after a maintenance
@@ -52,10 +53,11 @@ static void i3c_bus_maintenance_lock(struct i3c_bus *bus)
  * i3c_bus_maintenance_lock() for more details on what these maintenance
  * operations are.
  */
-static void i3c_bus_maintenance_unlock(struct i3c_bus *bus)
+void i3c_bus_maintenance_unlock(struct i3c_bus *bus)
 {
 	up_write(&bus->lock);
 }
+EXPORT_SYMBOL_GPL(i3c_bus_maintenance_unlock);
 
 /**
  * i3c_bus_normaluse_lock - Lock the bus for a normal operation
@@ -91,6 +93,20 @@ void i3c_bus_normaluse_unlock(struct i3c_bus *bus)
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
@@ -339,6 +355,22 @@ static int i3c_device_probe(struct device *dev)
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
@@ -460,6 +492,23 @@ static int i3c_bus_init(struct i3c_bus *i3cbus)
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
+bool i3c_master_owns_bus_locked(struct i3c_master_controller *master)
+{
+	return master->bus.cur_master == master->this;
+}
+
 static const char * const i3c_bus_mode_strings[] = {
 	[I3C_BUS_MODE_PURE] = "pure",
 	[I3C_BUS_MODE_MIXED_FAST] = "mixed-fast",
@@ -618,6 +667,25 @@ i3c_master_alloc_i2c_dev(struct i3c_master_controller *master,
 
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
@@ -691,6 +759,9 @@ i3c_master_find_i2c_dev_by_addr(const struct i3c_master_controller *master,
 	struct i2c_dev_desc *dev;
 
 	i3c_bus_for_each_i2cdev(&master->bus, dev) {
+		if (!dev->boardinfo)
+			continue;
+
 		if (dev->boardinfo->base.addr == addr)
 			return dev;
 	}
@@ -937,8 +1008,8 @@ int i3c_master_defslvs_locked(struct i3c_master_controller *master)
 
 	desc = defslvs->slaves;
 	i3c_bus_for_each_i2cdev(bus, i2cdev) {
-		desc->lvr = i2cdev->boardinfo->lvr;
-		desc->static_addr = i2cdev->boardinfo->base.addr << 1;
+		desc->lvr = i2cdev->lvr;
+		desc->static_addr = i2cdev->addr << 1;
 		desc++;
 	}
 
@@ -1490,6 +1561,83 @@ i3c_master_register_new_i3c_devs(struct i3c_master_controller *master)
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
@@ -1554,12 +1702,9 @@ int i3c_master_set_info(struct i3c_master_controller *master,
 	struct i3c_dev_desc *i3cdev;
 	int ret;
 
-	if (!i3c_bus_dev_addr_is_avail(&master->bus, info->dyn_addr))
-		return -EINVAL;
-
-	if (I3C_BCR_DEVICE_ROLE(info->bcr) == I3C_BCR_I3C_MASTER &&
-	    master->secondary)
-		return -EINVAL;
+	if (!master->secondary)
+		if (!i3c_bus_dev_addr_is_avail(&master->bus, info->dyn_addr))
+			return -EINVAL;
 
 	if (master->this)
 		return -EINVAL;
@@ -1605,43 +1750,13 @@ static void i3c_master_detach_free_devs(struct i3c_master_controller *master)
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
@@ -1650,32 +1765,24 @@ static int i3c_master_bus_init(struct i3c_master_controller *master)
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
@@ -1685,28 +1792,71 @@ static int i3c_master_bus_init(struct i3c_master_controller *master)
 
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
@@ -1727,6 +1877,13 @@ static int i3c_master_bus_init(struct i3c_master_controller *master)
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
@@ -1789,6 +1946,56 @@ i3c_master_search_i3c_dev_duplicate(struct i3c_dev_desc *refdev)
 	return NULL;
 }
 
+int i3c_master_add_i2c_dev(struct i3c_master_controller *master,
+			   u16 addr, u8 lvr)
+{
+	enum i3c_addr_slot_status status;
+	struct i2c_dev_boardinfo *boardinfo;
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
+	boardinfo = i3c_master_find_i2c_boardinfo(master, addr, lvr);
+	if (!boardinfo) {
+		ret = -ENODEV;
+		goto err_free_dev;
+	}
+
+	i2cdev->boardinfo = boardinfo;
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
@@ -2101,6 +2308,18 @@ static int i3c_master_i2c_adapter_xfer(struct i2c_adapter *adap,
 	}
 
 	i3c_bus_normaluse_lock(&master->bus);
+	if (!i3c_master_owns_bus_locked(master)) {
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
+
 	dev = i3c_master_find_i2c_dev_by_addr(master, addr);
 	if (!dev)
 		ret = -ENOENT;
@@ -2146,8 +2365,12 @@ static int i3c_master_i2c_adapter_init(struct i3c_master_controller *master)
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
@@ -2388,18 +2611,43 @@ static int i3c_master_check_ops(const struct i3c_master_controller_ops *ops)
 	     !ops->recycle_ibi_slot))
 		return -EINVAL;
 
+	if (ops->request_mastership &&
+	    (!ops->enable_mr_events || !ops->disable_mr_events))
+		return -EINVAL;
+
 	return 0;
 }
 
 /**
+ * i3c_master_bus_takeover() - register new I3C devices on bus takeover
+ * @master: master used to send frames on the bus
+ *
+ * This function is useful when devices were not added
+ * during initialization or when new device joined the bus
+ * which was under control of different master.
+ */
+void i3c_master_bus_takeover(struct i3c_master_controller *master)
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
+EXPORT_SYMBOL_GPL(i3c_master_bus_takeover);
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
@@ -2422,10 +2670,6 @@ int i3c_master_register(struct i3c_master_controller *master,
 	struct i2c_dev_boardinfo *i2cbi;
 	int ret;
 
-	/* We do not support secondary masters yet. */
-	if (secondary)
-		return -ENOTSUPP;
-
 	ret = i3c_master_check_ops(ops);
 	if (ret)
 		return ret;
@@ -2503,6 +2747,14 @@ int i3c_master_register(struct i3c_master_controller *master,
 	i3c_master_register_new_i3c_devs(master);
 	i3c_bus_normaluse_unlock(&master->bus);
 
+	i3c_bus_normaluse_lock(&master->bus);
+	i3c_master_register_new_i2c_devs(master);
+	i3c_bus_normaluse_unlock(&master->bus);
+
+	i3c_bus_maintenance_lock(&master->bus);
+	i3c_master_enable_mr_events(master);
+	i3c_bus_maintenance_unlock(&master->bus);
+
 	return 0;
 
 err_del_dev:
@@ -2519,6 +2771,30 @@ int i3c_master_register(struct i3c_master_controller *master,
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
@@ -2528,6 +2804,10 @@ EXPORT_SYMBOL_GPL(i3c_master_register);
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
index f13fd8b..8514680 100644
--- a/include/linux/i3c/master.h
+++ b/include/linux/i3c/master.h
@@ -84,6 +84,8 @@ struct i2c_dev_desc {
 	struct i3c_i2c_dev_desc common;
 	const struct i2c_dev_boardinfo *boardinfo;
 	struct i2c_client *dev;
+	u16 addr;
+	u8 lvr;
 };
 
 /**
@@ -418,6 +420,12 @@ struct i3c_bus {
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
@@ -445,6 +453,10 @@ struct i3c_master_controller_ops {
 	int (*disable_ibi)(struct i3c_dev_desc *dev);
 	void (*recycle_ibi_slot)(struct i3c_dev_desc *dev,
 				 struct i3c_ibi_slot *slot);
+	void (*update_devs)(struct i3c_master_controller *master);
+	int (*request_mastership)(struct i3c_master_controller *master);
+	int (*enable_mr_events)(struct i3c_master_controller *master);
+	int (*disable_mr_events)(struct i3c_master_controller *master);
 };
 
 /**
@@ -524,6 +536,8 @@ int i3c_master_defslvs_locked(struct i3c_master_controller *master);
 int i3c_master_get_free_addr(struct i3c_master_controller *master,
 			     u8 start_addr);
 
+int i3c_master_add_i2c_dev(struct i3c_master_controller *master,
+			   u16 addr, u8 lvr);
 int i3c_master_add_i3c_dev_locked(struct i3c_master_controller *master,
 				  u8 addr);
 int i3c_master_do_daa(struct i3c_master_controller *master);
@@ -536,6 +550,11 @@ int i3c_master_register(struct i3c_master_controller *master,
 			const struct i3c_master_controller_ops *ops,
 			bool secondary);
 int i3c_master_unregister(struct i3c_master_controller *master);
+int i3c_master_get_accmst_locked(struct i3c_master_controller *master,
+				 u8 addr);
+int i3c_master_mastership_ack(struct i3c_master_controller *master,
+			      u8 addr);
+void i3c_master_bus_takeover(struct i3c_master_controller *master);
 
 /**
  * i3c_dev_get_master_data() - get master private data attached to an I3C
@@ -645,4 +664,7 @@ void i3c_master_queue_ibi(struct i3c_dev_desc *dev, struct i3c_ibi_slot *slot);
 
 struct i3c_ibi_slot *i3c_master_get_free_ibi_slot(struct i3c_dev_desc *dev);
 
+void i3c_bus_maintenance_lock(struct i3c_bus *bus);
+void i3c_bus_maintenance_unlock(struct i3c_bus *bus);
+
 #endif /* I3C_MASTER_H */
-- 
2.8.3


_______________________________________________
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
