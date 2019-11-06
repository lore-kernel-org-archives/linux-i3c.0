Return-Path: <SRS0=i3Qy=Y6=lists.infradead.org=linux-i3c-bounces+linux-i3c=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B1EFC5DF64
	for <linux-i3c@archiver.kernel.org>; Wed,  6 Nov 2019 09:33:32 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D7F6D21D6C
	for <linux-i3c@archiver.kernel.org>; Wed,  6 Nov 2019 09:33:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="G82WImlX";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=cadence.com header.i=@cadence.com header.b="q64rTiWq";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=cadence.com header.i=@cadence.com header.b="g1SnJ0om"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D7F6D21D6C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=cadence.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:To:From
	:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=iNp5GXNFhk02CH4d2xwB9e48mktCClBi8cxxAmQsE4c=; b=G82WImlXAjIHCF
	eYyLCMTB8fA41zqmwx8Amuw3zcyziSRg8MuT58FDqvauVn30H+uycIGCeynUWR/aORFWzW/osJGg/
	+YpxAurirek2w0VpXmVUocfz/DNbWntSnV5rpsVhMNbyIXVPirMzdY1Zgjczq3e4/Ge3LUmcsHHBo
	r2vucnrqpJkSJnhwUFHUWXKWOIoqZxpSC1Zi2HEfUvUWv/Hc6fO9dJnSKZrbIMGPiGLphn0EAeEOj
	3TJMKrllivszVmZnqm5BC5e1VOYbpzR4Mq3v62q8agIJcngbXwk248SHYfHQhbdjP03lAPdKy1VqH
	XeQZ53pXLHWNKg09a3GQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iSHgx-0000bv-K2; Wed, 06 Nov 2019 09:33:31 +0000
Received: from mx0b-0014ca01.pphosted.com ([208.86.201.193]
 helo=mx0a-0014ca01.pphosted.com)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iSHgt-0000Zp-Ax
 for linux-i3c@lists.infradead.org; Wed, 06 Nov 2019 09:33:30 +0000
Received: from pps.filterd (m0042333.ppops.net [127.0.0.1])
 by mx0b-0014ca01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 xA69O3D8022899; Wed, 6 Nov 2019 01:33:23 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cadence.com;
 h=date : from : to :
 cc : subject : message-id : mime-version : content-type; s=proofpoint;
 bh=KHaWYA/MvJtT+qKZnLaxnazrHSpLYYGSDkzoYiDUZM4=;
 b=q64rTiWqEmYNUNNltMOIbkUyWQkceZ7YnTXdsF8hCeutY3dRdVTvCdpuGqIyBuiHTNJD
 fnrrYVgwS4lQsP21+GdooIefrVQGqiOipquENP2Mj58S1oJZhOa7xscPn6RIm4tqnSEE
 OnxXKdpmM+JemwCYO+7m6/OCGCpUcjnojSRlvcxQSf6+CAZy6mwsukbDpfE+jE4wAmDp
 400O9KIktpnj9ZyNGuTfc+uUXFZ1aTKEDx3zr1pg9HX3spIlTYmYP24NBiCt0CLbvE1J
 47loPXBSICjhIVrRNijIZYLxSGz4NqM87QMNUy9GCBpFzIkdgnYdQ6CqUygOSJydCLDx +w== 
Received: from nam03-dm3-obe.outbound.protection.outlook.com
 (mail-dm3nam03lp2059.outbound.protection.outlook.com [104.47.41.59])
 by mx0b-0014ca01.pphosted.com with ESMTP id 2w2t0q81uk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT);
 Wed, 06 Nov 2019 01:33:23 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=C9JSEnh7sMznUn725tIudz8wuzU5y+3cwRSykIFErfvSvg3BbG9lXXbC3fIwuvnlJ+XiwduvTOHpqYyRBeyojRGTwYzwrsTG3KTlUzfidQM9ECa444iQ7d9Nvzpg1k6+SBwHv8T8VBfpwFBeHR1P59sNSaEb60Pyh7WOkwgGSJbLQIzLqHYn8C71bUCaV8L6w17FqqkpVI+xCl2Cqhu1h5y6Nf6UNFGfIObNgT4mVkZj6mKAQerCWE2fJyk7La0praN+5A+WfviR9KaDPrJS8UBe1Qui6V4SahFufjchWBGklRpg6uPtopIzpqxtrdb3p+/fQIVRWWooqXt+dAyc7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KHaWYA/MvJtT+qKZnLaxnazrHSpLYYGSDkzoYiDUZM4=;
 b=ggKfdYUqoPcuwD3ggsPSKf3uwhpB4VAFOo7rkFNT+TCaKAYHjPXndHWOzpRrcRet1TAPJxUG1NkTrezUwizUvTB/W/4W9wgJ/wHZM0+xfAANeSo3cHDZSykol/J/NX91g1YGto0+VswYXAGZbWQICo1+fRBDyeAZekV254w2A+AGajC3hQRDlFvtdpbTZAjXymdVQPnoZLgu+B0UiYs6D6WZyqxFKibSvvGYierWR/T7dQW6ipIdxH7uqhI08Lkgkr6w8ISG0FBbcUyXvT+LnvWT7DxBYUa9qS3x5OHiceq6N0qV6eawCy+nubwRoCiqDhrPoCj0c3TYnXCMjNsmjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 158.140.1.28) smtp.rcpttodomain=synopsys.com smtp.mailfrom=cadence.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=cadence.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cadence.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KHaWYA/MvJtT+qKZnLaxnazrHSpLYYGSDkzoYiDUZM4=;
 b=g1SnJ0omKLhwgDbRIuEWyDfRQ+8QwxZCjuheGSRHJ0fExUSbpPBPsDYPxKeAsSsz+dQtP0lz+EIjm6bGq28+7umRu3tvQ3rY8UNLigo19ohUVMhfLJ+NC7Go90R7/MVDAN7mSFSNgrotcJCPsB6GdsglHaIz+hQznkNNwWakX6w=
Received: from DM5PR07CA0040.namprd07.prod.outlook.com (2603:10b6:3:16::26) by
 BN8PR07MB6113.namprd07.prod.outlook.com (2603:10b6:408:b4::31) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2408.24; Wed, 6 Nov 2019 09:33:21 +0000
Received: from DM3NAM05FT013.eop-nam05.prod.protection.outlook.com
 (2a01:111:f400:7e51::209) by DM5PR07CA0040.outlook.office365.com
 (2603:10b6:3:16::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2430.20 via Frontend
 Transport; Wed, 6 Nov 2019 09:33:21 +0000
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 cadence.com discourages use of 158.140.1.28 as permitted sender)
Received: from sjmaillnx2.cadence.com (158.140.1.28) by
 DM3NAM05FT013.mail.protection.outlook.com (10.152.98.122) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2430.10 via Frontend Transport; Wed, 6 Nov 2019 09:33:21 +0000
Received: from mailsj6.global.cadence.com (mailsj6.cadence.com
 [158.140.32.112])
 by sjmaillnx2.cadence.com (8.14.4/8.14.4) with ESMTP id xA69XK8W012002
 (version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=OK);
 Wed, 6 Nov 2019 01:33:20 -0800
X-CrossPremisesHeadersFilteredBySendConnector: mailsj6.global.cadence.com
Received: from global.cadence.com (158.140.32.37) by
 mailsj6.global.cadence.com (158.140.32.112) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Wed, 6 Nov 2019 01:33:19 -0800
Date: Wed, 6 Nov 2019 10:33:16 +0100
From: Przemyslaw Gaj <pgaj@cadence.com>
To: <Vitor.Soares@synopsys.com>
Subject: I3C Mastership RFC
Message-ID: <20191106093315.GA21952@global.cadence.com>
MIME-Version: 1.0
Content-Disposition: inline
User-Agent: Mutt/1.5.20 (2009-12-10)
X-Originating-IP: [158.140.32.37]
X-ClientProxiedBy: mailsj7.global.cadence.com (158.140.32.114) To
 mailsj6.global.cadence.com (158.140.32.112)
X-OrganizationHeadersPreserved: mailsj6.global.cadence.com
X-EOPAttributedMessage: 0
X-Forefront-Antispam-Report: CIP:158.140.1.28; IPV:CAL; SCL:-1; CTRY:US;
 EFV:NLI; SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(136003)(376002)(346002)(396003)(199004)(189003)(36092001)(47776003)(4744005)(486006)(186003)(6916009)(86362001)(7116003)(16526019)(386003)(2351001)(23676004)(70206006)(50466002)(70586007)(7696005)(58126008)(55016002)(16586007)(561944003)(316002)(2486003)(246002)(8676002)(26005)(6666004)(8936002)(356004)(956004)(6286002)(426003)(66066001)(5660300002)(1076003)(126002)(476003)(76130400001)(33656002)(54906003)(336012)(2906002)(478600001)(26826003)(6116002)(3846002)(7736002)(7636002)(53416004)(4326008)(305945005);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN8PR07MB6113; H:sjmaillnx2.cadence.com; FPR:;
 SPF:SoftFail; LANG:en; PTR:corp.cadence.com; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5db287de-7ae2-4a2e-603d-08d7629c5d23
X-MS-TrafficTypeDiagnostic: BN8PR07MB6113:
X-Microsoft-Antispam-PRVS: <BN8PR07MB61131433FEDF6FEC5E3DE859C2790@BN8PR07MB6113.namprd07.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5797;
X-Forefront-PRVS: 02135EB356
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: EWvOs88M7JagV87en8QFDo1PVrUVypfVqkHI3XsC175exwKnuKudc823VQ/HiIjgwol+ELlrPxb07CKAks1YXdYe251rjgJpbiR8/w8JnpZjlPMjqI/IJH9utbbOXtYl9t614T5CqUEjnXu4BObSkD5nxBa+i0haxSGOeO6w15S3kxd7d/W6z6AqCcFBECKWOltuJLrRujkUjnQxt+pH3pQi0L3co7SvGuzzFigo0xb5V5X2aakmG4mp/OfFcuirSPEktgp5cjcTK9+XgBaWcjpOMu6yiQu3Wn1zepbNZ4Jx4qchrpPhZc9y1utqstyY+JlVTcS8561RwvDVt0XmZgK6G11ZBL7fQ+asFimdZmhzPlCJNauVZNlPoy+jtpIyKRX7ygY65CgNsCg1JvqNFM22EuQT+jJjB5OQW4bLRugyZiQM3PwrKy2U5MEAsWyCz/EmWumTyoGOCcYZYhmhFQ==
X-OriginatorOrg: cadence.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Nov 2019 09:33:21.2143 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5db287de-7ae2-4a2e-603d-08d7629c5d23
X-MS-Exchange-CrossTenant-Id: d36035c5-6ce6-4662-a3dc-e762e61ae4c9
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=d36035c5-6ce6-4662-a3dc-e762e61ae4c9; Ip=[158.140.1.28];
 Helo=[sjmaillnx2.cadence.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR07MB6113
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,18.0.572
 definitions=2019-11-06_02:2019-11-06,2019-11-06 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_check_notspam policy=outbound_check
 score=0
 lowpriorityscore=0 malwarescore=0 clxscore=1011 phishscore=0 spamscore=0
 adultscore=0 suspectscore=1 mlxscore=0 priorityscore=1501 mlxlogscore=789
 bulkscore=0 impostorscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-1908290000 definitions=main-1911060097
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191106_013328_455280_F6CE0193 
X-CRM114-Status: UNSURE (   4.79  )
X-CRM114-Notice: Please train this message.
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
Cc: "linux-i3c@lists.infradead.org" <linux-i3c@lists.infradead.org>,
 "bbrezillon@kernel.org" <bbrezillon@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org

Hi Vitor,

We discussed with Joao in Lyon that you are ready with mastership RFC.
The question is when do you think you are able to post this proposal.
Our customer needs that and is pushing hard. I would like also to run all
the tests in our complex configuration and check how does it work.

-- 
-- 
Regards,
Przemyslaw Gaj

_______________________________________________
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
