Return-Path: <SRS0=nBCV=RK=lists.infradead.org=linux-i3c-bounces+linux-i3c=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=BAD_ENC_HEADER,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F975C43381
	for <linux-i3c@archiver.kernel.org>; Thu,  7 Mar 2019 09:58:36 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1CBA120684
	for <linux-i3c@archiver.kernel.org>; Thu,  7 Mar 2019 09:58:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="hPIkNxxN";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=cadence.com header.i=@cadence.com header.b="aCQNEm2p";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=cadence.com header.i=@cadence.com header.b="lmSqjbNW"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1CBA120684
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=cadence.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1EJQ6XNXgK2IiCJa+Dwv8vO+KEoso1/tvcl2LD/6l9E=; b=hPIkNxxNCTUCZD
	N7auu4SgVZbOwCyWbw2iAZdxGA9Rt9WQHD7FhU3NzihCacGiHZcxlFiYS4/3D6A+6fGwjIveTEvcX
	Tt27wJBIF2a74QM5T+cIeP9Nj0BCBMF8MiuWyLN7YDKNANyQVWZ5j4a709JhwKHgPIz2pk3PEo8GK
	LxXNivTGGXyXMN6yFM2XcRKeuL53eBxKYhi/jWVOtSohs6XdvRQs//t1ea6JUzMwQTqThnScE5Pwh
	9WM00zmfbG5BmeW/iBIFjoFGaCxkBeksEUyXO7+KbHmoj47s498vxq2KYmqxqAZQez1cWEc1wDYsw
	sBKnDwXFuw2lWnhgXsTA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h1pnP-0002O1-Pu; Thu, 07 Mar 2019 09:58:35 +0000
Received: from mx0b-0014ca01.pphosted.com ([208.86.201.193]
 helo=mx0a-0014ca01.pphosted.com)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h1pnL-0002N1-A8
 for linux-i3c@lists.infradead.org; Thu, 07 Mar 2019 09:58:33 +0000
Received: from pps.filterd (m0042333.ppops.net [127.0.0.1])
 by mx0b-0014ca01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x279rmNY004698; Thu, 7 Mar 2019 01:58:29 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cadence.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=proofpoint;
 bh=WaHEDkW2GLP/WDIQ14pqnjNBlC9Mpic66zsbSV3XaGM=;
 b=aCQNEm2pprieFwurce71ZnH8YNl56kwus9uJ9M9tKn4A+KyIqKva4DUDr4j+/Jf+TF80
 i3alHT38BsHTO4SF6zZc0xwuqTNsm2ImuGAAYDWs2itSQkCQ/PvG761wLkAJdvG75p7Z
 IuIJX20jlU1+R4OL709TGMjN2c6R1Pe/8rQifl+Noy1Mn4XAvVMTEi9BtnVmZBdP14xX
 daXj1BEhW4jQlJ8IbTWdUNy87tYbjwrz87bJt+ImlrsZDEtLLMdMC9wUmhs4IjqJfJsq
 F5IIYE9HnBK/1G5FJGWcenAFApKXYKlvWUFyAyx8wvWfBuAiR54sVgBnk/GcVP+4cTw5 Mw== 
Authentication-Results: cadence.com;
	spf=pass smtp.mailfrom=pgaj@cadence.com
Received: from nam03-co1-obe.outbound.protection.outlook.com
 (mail-co1nam03lp2058.outbound.protection.outlook.com [104.47.40.58])
 by mx0b-0014ca01.pphosted.com with ESMTP id 2qypa00g2w-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT);
 Thu, 07 Mar 2019 01:58:29 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cadence.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WaHEDkW2GLP/WDIQ14pqnjNBlC9Mpic66zsbSV3XaGM=;
 b=lmSqjbNWhEaUsYSDY2VzOAFMKiX4YduGEdSR5sCdIYCvgZicnfTPY5bHMFUphb2fpQfb4XU4H2F4gyb1pX5n78DCKFJKQickK1Gs79unXv2bQhylAKdBhSIoDriAVePOSOU95u8Y1hkMGagbDyhT9AW0Q5VJ9Tzg3AbayAU2w2o=
Received: from CY1PR07CA0023.namprd07.prod.outlook.com
 (2a01:111:e400:c60a::33) by BN6PR07MB2948.namprd07.prod.outlook.com
 (2603:10b6:404:41::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.1686.18; Thu, 7 Mar
 2019 09:58:25 +0000
Received: from CO1NAM05FT058.eop-nam05.prod.protection.outlook.com
 (2a01:111:f400:7e50::205) by CY1PR07CA0023.outlook.office365.com
 (2a01:111:e400:c60a::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.1686.17 via Frontend
 Transport; Thu, 7 Mar 2019 09:58:24 +0000
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 cadence.com discourages use of 199.43.4.28 as permitted sender)
Received: from rmmaillnx1.cadence.com (199.43.4.28) by
 CO1NAM05FT058.mail.protection.outlook.com (10.152.96.176) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.1686.5 via Frontend Transport; Thu, 7 Mar 2019 09:58:24 +0000
Received: from maileu3.global.cadence.com (maileu3.cadence.com [10.160.88.99])
 by rmmaillnx1.cadence.com (8.14.4/8.14.4) with ESMTP id
 x279wJZ5031683
 (version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=OK);
 Thu, 7 Mar 2019 04:58:22 -0500
X-CrossPremisesHeadersFilteredBySendConnector: maileu3.global.cadence.com
Received: from maileu3.global.cadence.com (10.160.88.99) by
 maileu3.global.cadence.com (10.160.88.99) with Microsoft SMTP Server (TLS) id
 15.0.1367.3; Thu, 7 Mar 2019 10:58:19 +0100
Received: from lvlogina.cadence.com (10.165.176.102) by
 maileu3.global.cadence.com (10.160.88.99) with Microsoft SMTP Server (TLS) id
 15.0.1367.3 via Frontend Transport; Thu, 7 Mar 2019 10:58:19 +0100
Received: from lvlogina.cadence.com (localhost.localdomain [127.0.0.1])
 by lvlogina.cadence.com (8.14.4/8.14.4) with ESMTP id x279wJ10023913;
 Thu, 7 Mar 2019 09:58:19 GMT
Received: (from pgaj@localhost)
 by lvlogina.cadence.com (8.14.4/8.14.4/Submit) id x279wJ3j023912;
 Thu, 7 Mar 2019 09:58:19 GMT
From: Przemyslaw Gaj <pgaj@cadence.com>
To: <bbrezillon@kernel.org>
Subject: [PATCH 4/4] dt-bindings: i3c: Document dropped support for I2C 10 bit
 devices
Date: Thu, 7 Mar 2019 09:58:08 +0000
Message-ID: <20190307095808.22540-5-pgaj@cadence.com>
X-Mailer: git-send-email 2.8.3
In-Reply-To: <20190307095808.22540-1-pgaj@cadence.com>
References: <20190307095808.22540-1-pgaj@cadence.com>
MIME-Version: 1.0
X-OrganizationHeadersPreserved: maileu3.global.cadence.com
X-EOPAttributedMessage: 0
X-Forefront-Antispam-Report: CIP:199.43.4.28; IPV:CAL; SCL:-1; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(39860400002)(396003)(136003)(346002)(376002)(2980300002)(36092001)(189003)(199004)(26826003)(50226002)(87636003)(5660300002)(305945005)(26005)(36756003)(106466001)(2906002)(4326008)(97736004)(6916009)(186003)(478600001)(51416003)(48376002)(50466002)(76176011)(68736007)(86362001)(336012)(107886003)(446003)(69596002)(81156014)(11346002)(8936002)(4744005)(476003)(2616005)(426003)(126002)(486006)(2351001)(1076003)(6666004)(54906003)(316002)(81166006)(16586007)(47776003)(14444005)(42186006)(53936002)(8676002)(105596002)(356004);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN6PR07MB2948; H:rmmaillnx1.cadence.com; FPR:;
 SPF:SoftFail; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a8ec0edc-5426-4682-dd18-08d6a2e3703a
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600127)(711020)(4605104)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7153060);
 SRVR:BN6PR07MB2948; 
X-MS-TrafficTypeDiagnostic: BN6PR07MB2948:
X-Microsoft-Exchange-Diagnostics: 1; BN6PR07MB2948;
 20:2LGs9m+OJmL6fzsyPE8VGvkS8ndk0l4j9VkMMpuJgplIumzaTF3M2DBJ5i1Cwl6sXORUD68r/TPZzqKLgXJ5uMPNboQukKsCfhSFAO9KdPqVaHAyVSH35NbP1212RI0bu2ZU1ofNfpLwEeT0uJLR8YexrgIStDPvdCPrRFyWTcxYFAVBipoK6rpflOhfICkCbtVVOfxW4jIEqDVx3WxSMrtRmGEWOPuBI+QyLAtX7yS0xCCidBQaa7GxEAXZnVahLaQ3ODEkrI0Z3mLn2z4qE4sq36urFBgg+0vLFNSygX8mmvf6b7cr0ED43QYGzKGFJdN8vSu1FPHCP2oCyQ6V6NOwmvN9fXlxBQ0WmkUS94/W5HVCaXrDLcD5Ha3UBxFlcCO8PsTLtOJ7J5T/iFaHo5FcHIOHk0QU4xFHTxfspeobAyhj01eEfYGdtYsSADn204gFWV+Qtex9HMAH1LCZTPJ/eg+nUsW1JO8MgaWcTw9dF2JJesOzI/YgXT2nwcRw
X-Microsoft-Antispam-PRVS: <BN6PR07MB294883935EAA5C30B9C21263C24C0@BN6PR07MB2948.namprd07.prod.outlook.com>
X-Forefront-PRVS: 096943F07A
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; BN6PR07MB2948;
 23:UeZHkCPfTRc0zO/0cxvt9COu8s/An9/8ZaOs4uhlY?=
 =?us-ascii?Q?KUdLj/EwsNURe/F98otqu7bKYsn0fI569/DFMTvF534K0E7TpfGKDBOCQD17?=
 =?us-ascii?Q?JN+v8iMZ8ySHF6Y+0KAIQUIVEY1OLNr9lB5t6m51BVVQhr/Q3QSRpx3tR24z?=
 =?us-ascii?Q?uEvt5bdzb84aPDxdLi7w3gp3q+qlgNiSmgUVaetM59QyDunzz6V12BGYXABu?=
 =?us-ascii?Q?CKD/EYPKSJeY3WrBqT3XmdyrTaQ1jAEYpMp1FFGVjuMzmTnPdIAZEcopKFY0?=
 =?us-ascii?Q?YVZ0y42f5yOs+RIfyi/+jR2yRe9RZn+qtN5PAse6M3gzfebXDGOYsWru8quk?=
 =?us-ascii?Q?KTXnQj4uRB+s2yBcUnSya/KLrkAp3EM2s923OGF5nJEYVqRKOMKqQrjj5nwL?=
 =?us-ascii?Q?6HkMNGgQpqQn5Z1rRoasuhct3/+kud/tjlaaAahOKPU+KBY4IQh0EmXd5hKj?=
 =?us-ascii?Q?oFzRX6fSq1wr8rPf4rU2f6j+lfV0FwLzBpQhGhiBbfs1x4CHCRYeUScHmcFt?=
 =?us-ascii?Q?hSX6+mib3uxke2yU+zIQrYDJDg00NHo8WXGPZ0R2ATUrpvnEDeICsQ8y28pE?=
 =?us-ascii?Q?JbA8TDqMWHp31aqfVc2EAbS3qoFYHmrzA6rK1ZZAQ3LyCOkmbGkqffQgwEo6?=
 =?us-ascii?Q?B1fjG2gmX2vB8s/qNuB8SxtJgmcSWccb9zGamG/EqNfzAfLxVTyOEsfCEJNa?=
 =?us-ascii?Q?OEupXGbNWyqcWR7C9BpsK75dqN4UFCnPVFs+UBLqUZ1aPiMXtKZ7Ba+xLkzY?=
 =?us-ascii?Q?4LzUWaPdTJo6dQaxI3aLaBukaCOoDeShKi+n0t4A2tA9djyJo/Ducdk2WMJc?=
 =?us-ascii?Q?4i9qWIJKorZKRZtGb9dAARY73dNxvyR1iKupGsTzk70aE4O5DjybfRuhkVVn?=
 =?us-ascii?Q?lAZaWY72f3gNs4d9uNw91kDbHbqgi1BZ1SPMPN5R+AjeEbOodDAUgm6vQZyD?=
 =?us-ascii?Q?Fj6ikapw41k4I6keHsbg2zQt3flZn6AVxFJwFQO7I0GUvy1UVhfBhxwcb/jk?=
 =?us-ascii?Q?D45T1HEQ4y/tcycO/pJJi2HfcPVwzxC9xvFu6WKsJcqqkwJ8frvzkF6wGqCW?=
 =?us-ascii?Q?btbXWlCmLD/wB6AkCcDCydpo/AihD6iZ3W/F8kUMY+w1Pn3Exrv1vUId7tCE?=
 =?us-ascii?Q?k2ekbvB6K5FWvtu7nCma3vJLmhPGtA1fKWUPG2bQf/xl3NQVOLSeZ3Bplgwt?=
 =?us-ascii?Q?omyH7yXvabEE4Nk240aEOWWwQEs3gv83a+adAm/YLYSalVLNP5uGqvALXME2?=
 =?us-ascii?Q?NU4ScrKSmlK+l4OOvw=3D?=
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: ntzW0PZ5KgYxwJLkFS3YPoCoh1OlbtiiG02RlgD1qGDRy4Eds7Edn3NE71Njsw6zUeB9dYgTJ+A/dmc/hJ8P3lKpR+jfUgehlb9E1cMn/6Og4k05Fg6wQby2hnxlXbB9+o+Vu8myAUU7Ni3LfFSJhcBbKvlythybNukcZ/LYSTivcg6VKiTN6rMJIk2eh5XONTfgoJeWpgQCIJU7WHQTOoij2TxkPG9pQmT1uEz8aKvN/802ZJRW/M/w2/9m80rJyg3K+R3+qqfhlM7m0YR+wH3YCCkcQTy7KMKFHizF3D1BfHRAYGqjGpJwzBYo+/CGHRlE1umfY2rOAVm8O1q3YrHC/YdN8R75LoCjqYonOs1oV9EwDkfLuT+Ad8ttrLrSrz7FtYBqrsaxw7tEHeK0YsYped1tus3dTHdFOysw5s8=
X-Microsoft-Exchange-Diagnostics: 1; BN6PR07MB2948;
 20:SguwdLEKuNo2IBJwrNKe8lDmXNGCeCzdKvrqwF4WYgLFHnEDLNgGSmPmiT/D4krdsqogXkxuHmy0GvmkZmuvszDFkc05Q4k+qF+E9G613Ua/20c47FEr7/m9rktQUx6mSfEHPp4MfDYHmBYHfm/sQ2y+sam35VFmZQUFZA7dhnDBL4ED5+FAQt/FDTxqeckbGMKAU/mDSNIWuw4UW1SbSg9TFaupLGfQ31WBPHxUlqnkGL9h8x0hNA3xCX6TxAjp
X-OriginatorOrg: cadence.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Mar 2019 09:58:24.0735 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a8ec0edc-5426-4682-dd18-08d6a2e3703a
X-MS-Exchange-CrossTenant-Id: d36035c5-6ce6-4662-a3dc-e762e61ae4c9
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=d36035c5-6ce6-4662-a3dc-e762e61ae4c9; Ip=[199.43.4.28];
 Helo=[rmmaillnx1.cadence.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR07MB2948
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
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1903070072
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190307_015831_530363_254C9F94 
X-CRM114-Status: UNSURE (   9.83  )
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

Because this patch series dropped support for 10 bit I2C devices, I'm
documenting this.

Signed-off-by: Przemyslaw Gaj <pgaj@cadence.com>
---
 Documentation/devicetree/bindings/i3c/i3c.txt | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/i3c/i3c.txt b/Documentation/devicetree/bindings/i3c/i3c.txt
index ab729a0..4ffe059 100644
--- a/Documentation/devicetree/bindings/i3c/i3c.txt
+++ b/Documentation/devicetree/bindings/i3c/i3c.txt
@@ -39,7 +39,9 @@ valid here, but several new properties have been added.
 New constraint on existing properties:
 --------------------------------------
 - reg: contains 3 cells
-  + first cell : still encoding the I2C address
+  + first cell : still encoding the I2C address. 10 bit addressing is not
+    supported. Devices with 10 bit address can't be properly passed through
+    DEFSLVS command.
 
   + second cell: shall be 0
 
-- 
2.8.3


_______________________________________________
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
