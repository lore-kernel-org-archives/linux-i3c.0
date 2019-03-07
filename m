Return-Path: <SRS0=nBCV=RK=lists.infradead.org=linux-i3c-bounces+linux-i3c=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.0 required=3.0 tests=BAD_ENC_HEADER,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B87BC4360F
	for <linux-i3c@archiver.kernel.org>; Thu,  7 Mar 2019 09:58:29 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D1E0820684
	for <linux-i3c@archiver.kernel.org>; Thu,  7 Mar 2019 09:58:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="PU+iXAK4";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=cadence.com header.i=@cadence.com header.b="fipj5mvA";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=cadence.com header.i=@cadence.com header.b="GbMIeyNU"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D1E0820684
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=cadence.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=5WpksmTKpgky5OGjUg/XuaHtwNFZuREiraNhBVQll6Y=; b=PU+iXAK4fwCebl
	/avIRoFV1wrwMaCdujZWluxMNV22/yohlGqH5g3tmriJ58707v97LQelmTf/o3jaUFFilcy3l0etN
	MrsqyZaUlQ7iWjVheHcCldhntaly14zdh2KayT1l6yBJ5cOSCGqHo5ZZQzLoBRKXkJkeDT5a3dASP
	F/rpUvDIAYFISjhuREmfAva76DC9AY5unCB5zaUatbarN4kW/2cOv68XWV4usudAwE1wNoo4lcd8g
	VuEGPQK7BhNtJRlxcV9L/aFAUmMfACJUZt9LPfWkrsHrg51MRTB31v5DGxMJVecT5FCBqZvFIEZF8
	Vf0wDkmrTty3EjYdk/MQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h1pnI-0002LP-G9; Thu, 07 Mar 2019 09:58:28 +0000
Received: from mx0a-0014ca01.pphosted.com ([208.84.65.235])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h1pnF-0002KH-Df
 for linux-i3c@lists.infradead.org; Thu, 07 Mar 2019 09:58:27 +0000
Received: from pps.filterd (m0042385.ppops.net [127.0.0.1])
 by mx0a-0014ca01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x279vSxH017794; Thu, 7 Mar 2019 01:58:21 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cadence.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-type; s=proofpoint;
 bh=/b/ZgTne22O/XtEY/UfQbl0pQ0qwzT4IxRB0oAn5gdw=;
 b=fipj5mvAFVVkerrzYZryXNuK2IRpE+VwWOUiqOlee7vpt/Z5cu1ySHPPZWqquwD1xdF7
 4RuxzpQMchKTKg2HMHxlJGYdS+YEKCfVyd/aiB4RauFq+mbFkz1n+eO7+cKwyf4mSHb9
 Ru/gvF+wcfu+/JVvrhMPF/Zh+5KQYhkON1sneXOAK/46PEhVkSWoDYOcOO1X9+9gjy92
 6PmRvcNAPqV6sXRX9o5KmI4Y3gOxdkfi2o93mzaTzvRH0QP/UUdRsLWHyT1CvmGWv2M3
 mE+3yusCLMz/vPab2zoOcWSkohu6fDpJhGXHUOc6jZiOeS08D2uom5aOnGoooBI77Ktm Lw== 
Authentication-Results: cadence.com;
	spf=pass smtp.mailfrom=pgaj@cadence.com
Received: from nam01-by2-obe.outbound.protection.outlook.com
 (mail-by2nam01lp2055.outbound.protection.outlook.com [104.47.34.55])
 by mx0a-0014ca01.pphosted.com with ESMTP id 2r2bec67as-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT);
 Thu, 07 Mar 2019 01:58:21 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cadence.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/b/ZgTne22O/XtEY/UfQbl0pQ0qwzT4IxRB0oAn5gdw=;
 b=GbMIeyNUcFAK8sSsWPx1vSt9N7oe5/ooiQSIIz+Xwvm1qaMyVpv9OIYbiMrjX3KpsBMVK2B7PonjhXmoUK0tT4n3c5E5VKYOhhUEpIVWpDjh7nMBgFVQ5VtYTenRmoFXMoBdvYPNAJ7HrfjyRt4bkgn345QIlLCEuLn2DHAXuk4=
Received: from DM5PR07CA0080.namprd07.prod.outlook.com (2603:10b6:4:ad::45) by
 CY1PR07MB2167.namprd07.prod.outlook.com (2a01:111:e400:59d7::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.1686.18; Thu, 7 Mar
 2019 09:58:19 +0000
Received: from CO1NAM05FT037.eop-nam05.prod.protection.outlook.com
 (2a01:111:f400:7e50::207) by DM5PR07CA0080.outlook.office365.com
 (2603:10b6:4:ad::45) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.1665.18 via Frontend
 Transport; Thu, 7 Mar 2019 09:58:19 +0000
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 cadence.com discourages use of 158.140.1.28 as permitted sender)
Received: from sjmaillnx2.cadence.com (158.140.1.28) by
 CO1NAM05FT037.mail.protection.outlook.com (10.152.96.150) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.1686.5 via Frontend Transport; Thu, 7 Mar 2019 09:58:18 +0000
Received: from maileu3.global.cadence.com (maileu3.cadence.com [10.160.88.99])
 by sjmaillnx2.cadence.com (8.14.4/8.14.4) with ESMTP id
 x279wFhO016727
 (version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=OK);
 Thu, 7 Mar 2019 01:58:17 -0800
X-CrossPremisesHeadersFilteredBySendConnector: maileu3.global.cadence.com
Received: from maileu3.global.cadence.com (10.160.88.99) by
 maileu3.global.cadence.com (10.160.88.99) with Microsoft SMTP Server (TLS) id
 15.0.1367.3; Thu, 7 Mar 2019 10:58:14 +0100
Received: from lvlogina.cadence.com (10.165.176.102) by
 maileu3.global.cadence.com (10.160.88.99) with Microsoft SMTP Server (TLS) id
 15.0.1367.3 via Frontend Transport; Thu, 7 Mar 2019 10:58:14 +0100
Received: from lvlogina.cadence.com (localhost.localdomain [127.0.0.1])
 by lvlogina.cadence.com (8.14.4/8.14.4) with ESMTP id x279wE4M023743;
 Thu, 7 Mar 2019 09:58:14 GMT
Received: (from pgaj@localhost)
 by lvlogina.cadence.com (8.14.4/8.14.4/Submit) id x279wDps023618;
 Thu, 7 Mar 2019 09:58:13 GMT
From: Przemyslaw Gaj <pgaj@cadence.com>
To: <bbrezillon@kernel.org>
Subject: [PATCH 0/4] Drop support for I2C 10 bit devices from I3C subsystem
Date: Thu, 7 Mar 2019 09:58:04 +0000
Message-ID: <20190307095808.22540-1-pgaj@cadence.com>
X-Mailer: git-send-email 2.8.3
MIME-Version: 1.0
X-OrganizationHeadersPreserved: maileu3.global.cadence.com
X-EOPAttributedMessage: 0
X-Forefront-Antispam-Report: CIP:158.140.1.28; IPV:CAL; SCL:-1; CTRY:US;
 EFV:NLI; SFV:NSPM;
 SFS:(10009020)(39850400004)(396003)(376002)(346002)(136003)(2980300002)(189003)(199004)(36092001)(42186006)(105596002)(47776003)(51416003)(316002)(2351001)(2616005)(48376002)(4326008)(54906003)(4744005)(50466002)(1076003)(16586007)(186003)(26005)(106466001)(478600001)(8936002)(26826003)(356004)(6916009)(6666004)(5660300002)(50226002)(107886003)(2906002)(8676002)(87636003)(486006)(7636002)(126002)(476003)(305945005)(426003)(336012)(86362001)(246002)(36756003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:CY1PR07MB2167; H:sjmaillnx2.cadence.com; FPR:;
 SPF:SoftFail; LANG:en; PTR:corp.cadence.com; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 54497192-98c6-4164-b4be-08d6a2e36cde
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600127)(711020)(4605104)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7153060);
 SRVR:CY1PR07MB2167; 
X-MS-TrafficTypeDiagnostic: CY1PR07MB2167:
X-Microsoft-Exchange-Diagnostics: 1; CY1PR07MB2167;
 20:rfOmvY5P5FTtGwDf/e8OUIL6rRZnpca39j10Ct1Ul42srWYBSxgEcJIMedSswsnrluKSLHUHsCoh0nEJCphr2sJPWHWZVYuS0pjE3lrhX3V9//rOvFLRXME908+emDXsEtmn/Dfwfsda06GnMRkL1VCdMzT9v/2D3oFxOiebUkhmZ39mZp8klQJr1x+3ri9qyh46xavJe843I2QvXjiOtxncl07kvN0JdfejrQT5PGD9+Xiz4iPNivtnYzsZqc5W8JszWg1w2xe7ygLJeX9iQF+1Ldq5+OYOYRaYjaHEgXSk0UoWjxapgGDQ2WOEVtENEwx1QNmYL3qfbTWdRLGRcmPWPGCDyeHCLV43Zu5Np/vHAxYQmP4T5+aPVWXFdNdUQa8pT/q+Xb4K5L4kvnSZ91LxYOQ3SGJK8oUPsAq7e01c90m/Is7BuCiZpDUbvSEAdUBq/fEVsi4u6R5eIIP3NNPYiq9cG+9Ocj2+twsvwxQb34Kda8AoHNshqhVRJ5G/
X-Microsoft-Antispam-PRVS: <CY1PR07MB21674D57AAD7D4C9B288BCE8C24C0@CY1PR07MB2167.namprd07.prod.outlook.com>
X-Forefront-PRVS: 096943F07A
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; CY1PR07MB2167;
 23:eQP7zIoKIONGD2uN4OMNRuf9+L/LHTrWvZKDC355Q?=
 =?us-ascii?Q?waTjm79H4V+UXJ2hidZiJ3r4aMzqBNYCoHC1NSczb+1umzXprcuSID2a7XUu?=
 =?us-ascii?Q?gMacw4hbZKefhKev1Dg3O79sXrZKyJjKFp7JVm141k7kfTrnvnDl7opivWPU?=
 =?us-ascii?Q?05dt2nwbtLOhusA/j89uXEH64Bk5uAF5H9iGFYm2Lav1pQufTBWkk12SGKuw?=
 =?us-ascii?Q?Hugi4AKloNX4YuWn8aM0yMpwAMCILuqTs/jYmlyzZGRTOfOPY6dRkErdU+AP?=
 =?us-ascii?Q?rekTrm/QTQUTNNlnOSsjHz41c0nFbA4xt+4lNzH3AWaMQOz5tgM1/LZMsMiD?=
 =?us-ascii?Q?k70tEtlwqRVIEgYK7VUGoI5v2nPo4ECm4YoHHY+QPeuNqGX8WkIFUWPEmRyb?=
 =?us-ascii?Q?xJwQJSaFmdF1nKQuSYXyQRNC10V207VNA0v+C7HEdPySkAUxOz+v/3bCYGjb?=
 =?us-ascii?Q?nZ7DwVRY6WglvN1BswU3nfGwMJ2tfygSFqC4sqdT8BtuVa1fW6nbrHSJToMQ?=
 =?us-ascii?Q?J93PBmORboegRlBFM1cCF9FSEgfGi2LfHg+EOdZAs5FIkjZ9gdyAWBxqMVCc?=
 =?us-ascii?Q?dwSK1EcA8xM2G0N7vYHXY4w1s3y/gCNJtWaPi9CYX+pZeB3tJ/tbVaD7/NU7?=
 =?us-ascii?Q?YXZm7lPPi9IWPD8kEYE/ZoMVAbuaLZ5pohmac6oiz7JL4RX8ciqQfP4ovhKd?=
 =?us-ascii?Q?U8EeGhZ5Eh6rFz/CjPfaZ5m6YdH4IVRXpEZGd4dgTvz4WngZeNL2U/cxByz9?=
 =?us-ascii?Q?DwTsCkX+BG59M9GXhE9/gL6ybkUUSDiPd/A3ZpP5Onc0fI/3uPLoVa9vK1nK?=
 =?us-ascii?Q?G8yYc2171Ah3uC6bhe541ABImZTqofbAca3xMxsfSPzEOT4ZdILPzxE01NAq?=
 =?us-ascii?Q?6qtvxVD5a3776CmZ83u7ogCPTRUGcAGm47XaqujDUzqLR8sXXbhYAVKeGiTZ?=
 =?us-ascii?Q?BMJ8smSrx5KhLY9LfKpQic43rIvnEm8cotsrnfQXX0ZGfpRHWCoJLPNkPTP8?=
 =?us-ascii?Q?G2L1MuVt3BJR7w74NcVon5CwaVOBgY+yZiGL5cFuRuRhWS1O0mOoeXgLHQUK?=
 =?us-ascii?Q?nyRfFIAtIcJPGYL45y3L3+fF/Zg?=
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: ODxZggpqSP481JzaGe4v4d1ERWKEQt3QPbzj5DxJutArt4ioTn1WJhcPqC+h0tzLmHMiJmfN7rYGB3ocjKsaCS1ZXPxF3jDcBGhvz+VIREcjbJD2quZH8kToNXgwQ/4t7Z+B1cr2F9uvsdXqgKhzWAYmHsAw/jvqg889Dn0GL+6p71ntC+43PSjbHL0IuaNCnnzp75yFhxMibQ8xuRJGkEApg3o2m4QNusOl6WqKvKAZ59TrPkgcikKMa5Ex8kXtZCTtjyVXfdBgfmVmN+WZlczpmKOPFpP/CIqsp0/4sbpt6kRDMnIDMJ7CI9n2fxYZZqLmeXK/liw8Z4drveztjlhgqMVSS2WjDloCv7EZtfHofGoBn5X8gP1l407OyXwp5ITkyIEGAI4pGmlup01gFfV8uGW/gLYWtp1lmsA9+CQ=
X-Microsoft-Exchange-Diagnostics: 1; CY1PR07MB2167;
 20:ovMx3SjSfnXFACm9LX8on/tP2JPkd2AANyue4KpBP5M6C4utpGhOQ9d+kyLWJ7FjQetLeYBVwzC4ZGNNrPDAERyUvdirdmH3Og8gE1My6v+2AQCh7tKwEcwkOruJdYV4UAHe/ZuSFr6lEHXzxzo/jMEwB1a2yhJs+6p+6w6OW6NkIdNKL0rcmofPjMZpg3yiMhgVV0edWAYn6coXUB6wWnjSVSd6/3Vct2jtz67s0pwHtmSoHY16RWKlfAm/iyRj
X-OriginatorOrg: cadence.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Mar 2019 09:58:18.5753 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 54497192-98c6-4164-b4be-08d6a2e36cde
X-MS-Exchange-CrossTenant-Id: d36035c5-6ce6-4662-a3dc-e762e61ae4c9
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=d36035c5-6ce6-4662-a3dc-e762e61ae4c9; Ip=[158.140.1.28];
 Helo=[sjmaillnx2.cadence.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY1PR07MB2167
X-Proofpoint-SPF-Result: pass
X-Proofpoint-SPF-Record: v=spf1 include:_spf.salesforce.com
 include:mktomail.com
 include:spf-0014ca01.pphosted.com include:spf.protection.outlook.com
 include:auth.msgapp.com include:spf.mandrillapp.com ~all
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-03-07_05:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_check_notspam policy=outbound_check
 score=0
 priorityscore=1501 malwarescore=0 suspectscore=1 phishscore=0 bulkscore=0
 spamscore=0 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=825 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1903070072
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190307_015825_586911_C1479F23 
X-CRM114-Status: UNSURE (   6.44  )
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
