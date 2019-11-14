Return-Path: <SRS0=SSUK=ZG=lists.infradead.org=linux-i3c-bounces+linux-i3c=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32F7BC432C3
	for <linux-i3c@archiver.kernel.org>; Thu, 14 Nov 2019 10:54:50 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 047AB206F0
	for <linux-i3c@archiver.kernel.org>; Thu, 14 Nov 2019 10:54:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ingQbhek";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=cadence.com header.i=@cadence.com header.b="HxJemkK3";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=cadence.com header.i=@cadence.com header.b="rcr1qFrX"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 047AB206F0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=cadence.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cPDwSg1d8oTluhQvHvhgJN02cVbebQEyM4vqI/f+BxU=; b=ingQbhekNPUC66
	judawCR4qsh7t7vstTD3HZH/ZOBkoNG0oxT/I9+kdWQXw0LzoKUeGjGI3Nuy4E9j69LZye0IXxsRs
	F/KFdmREqMJuvoVy/TNH6CKXQ0uY4Oz/yQI0PkYcfkl0HkMwVFsuSXZ5xE/+MMkKNOInN5gd47OC/
	coCus3kUj/YJSsUz3pOKKfH5r4t+CWUQpVB4RHQveJRuR7WAyNZKvR63v98Qj0dTYhnYg6zPdpDHy
	/NSogI3piaNkwfBKmyrzTs+3mwd2ECmwvF8GtNjY86/X2VbVABK72qN4OKc8Hl5DVojx88IBxAP7s
	gK8XY+pXR/rTorXtg0Kw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iVCm1-00082f-LE; Thu, 14 Nov 2019 10:54:49 +0000
Received: from mx0a-0014ca01.pphosted.com ([208.84.65.235])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iVCly-000828-H5
 for linux-i3c@lists.infradead.org; Thu, 14 Nov 2019 10:54:48 +0000
Received: from pps.filterd (m0042385.ppops.net [127.0.0.1])
 by mx0a-0014ca01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 xAEAqqgs004709; Thu, 14 Nov 2019 02:54:41 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cadence.com;
 h=date : from : to :
 cc : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=proofpoint;
 bh=z3huwxX8oe+v38Pa9BGsoSdrLydcrWR4P0GWewtGr80=;
 b=HxJemkK3OKZxlwJN0DFw/tZ7bua1U0fGscr5eOdIrTCF/brvbWhRHFcpJGWgwukEXtGg
 YVLmCZQ3B+ERj4rpmn31jAzhrQjPUhL9qrxYU+BVKyPpL9puLK3imRW/0ZlMQn1LUM4L
 WcKJ9l6kipbQc0N+kwZy7w4wVBCI6afQLFLlYFhvdYlG/SfKtLGanmj1WZpHpL9mua5X
 gyvN+6m1oWQvCIkPEgIGfSQFF639JR8bn6LCq5XVJF3JNR3KUwoNZdez9zZFWePlHXGG
 s/27b+61SQ8Q4c234XBhHsYMta/2x2YGEvidBZUYR6GZmN31LomaGZmwChU4VVCzF+kw Ng== 
Received: from nam03-co1-obe.outbound.protection.outlook.com
 (mail-co1nam03lp2051.outbound.protection.outlook.com [104.47.40.51])
 by mx0a-0014ca01.pphosted.com with ESMTP id 2w7prt1y26-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 14 Nov 2019 02:54:40 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NqgGtUAhivGnHk+YMC3S6+Gq4C1sazSRLMkNWbqYlzgwr/tZy5NvH1qt7wcNGP18zxzKSuWyWG4xGC9HqZUWRdBwiyht1u7Sm2MClR9ddjTxs3lXtOTM+BlW9bxxwsHox6UIghSEqdP8pVhh2E6eTsBEwO0BcV9mP3M+aYb78GuK/JnMDk5LTbESXU374nL+wLYS7Y7cZ0aoTpCCx95lHzXceyAr8t7A2vfLvC7vuvC70Z4EzvQrCmiJsqEFsZ1KyTSRRkluuCapwH1fUzJxz43dBD2H6ZqD9zBZTwpqNtSREDh47zmqr8dJPvYh41CqlIxV1H2xgL2RUTqeIv582Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=z3huwxX8oe+v38Pa9BGsoSdrLydcrWR4P0GWewtGr80=;
 b=YXBnCpohKwYZsq4os+zH6s8Uom0un+uCS5WsVTZrG+jHd8oquAH+0iX6IWbj8DttrV7WO5GzvcYCxBI/0DLEfDqTnyAioP/l5zuVNbX7VeLsl5DxKlepA2zHQ5YrCVRCZTruHHB1MzYH/0WzeEoRfSS/cKda2nbOhOQVGZJ7E4w8mL5T33aQGAMXP333PfZCMkZBXmXMF3p1nuJEcXUS+zrfYSobQ4Vm1s2kgkGoMPQIzYxz4jlcWBAeK4TXbbsr+TZBHwlzfEIFAi9TcnpS1b/+8QpTHVCWyrdhXRI0vp/7Mc6oooxFB6b5t89lxJzu8y6X4QRUqoO7d6CFe0sAww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 158.140.1.28) smtp.rcpttodomain=lists.infradead.org
 smtp.mailfrom=cadence.com; dmarc=fail (p=none sp=none pct=100) action=none
 header.from=cadence.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cadence.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=z3huwxX8oe+v38Pa9BGsoSdrLydcrWR4P0GWewtGr80=;
 b=rcr1qFrXV2Mj6qXiweqzRX5qvQihYb0oTL1hTFEZepCd5sfm5JRWCfkCTsHv+zUc45xN+usTm4UuCvvmg9ljLgeO8qGC15TTyBCXwfpx4yS/F3RdCnqhT+9UXAtXi1I//BSVJWiO+3VjxFzuKdUZNXs0Ej9RHfgSggVmZPQ/I4Q=
Received: from BYAPR07CA0032.namprd07.prod.outlook.com (2603:10b6:a02:bc::45)
 by SN4PR0701MB3744.namprd07.prod.outlook.com (2603:10b6:803:4e::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2451.23; Thu, 14 Nov
 2019 10:54:39 +0000
Received: from CO1NAM05FT034.eop-nam05.prod.protection.outlook.com
 (2a01:111:f400:7e50::201) by BYAPR07CA0032.outlook.office365.com
 (2603:10b6:a02:bc::45) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2430.22 via Frontend
 Transport; Thu, 14 Nov 2019 10:54:38 +0000
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 cadence.com discourages use of 158.140.1.28 as permitted sender)
Received: from sjmaillnx2.cadence.com (158.140.1.28) by
 CO1NAM05FT034.mail.protection.outlook.com (10.152.96.146) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2474.8 via Frontend Transport; Thu, 14 Nov 2019 10:54:38 +0000
Received: from mailsj6.global.cadence.com (mailsj6.cadence.com
 [158.140.32.112])
 by sjmaillnx2.cadence.com (8.14.4/8.14.4) with ESMTP id xAEAsaWI027997
 (version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=OK);
 Thu, 14 Nov 2019 02:54:37 -0800
X-CrossPremisesHeadersFilteredBySendConnector: mailsj6.global.cadence.com
Received: from global.cadence.com (158.140.32.37) by
 mailsj6.global.cadence.com (158.140.32.112) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Thu, 14 Nov 2019 02:54:35 -0800
Date: Thu, 14 Nov 2019 11:54:32 +0100
From: Przemyslaw Gaj <pgaj@cadence.com>
To: Boris Brezillon <boris.brezillon@collabora.com>
Subject: Re: [PATCH 2/3] dt-bindings: i3c: Document data hold delay feature
Message-ID: <20191114105431.GA27940@global.cadence.com>
References: <20191114055155.20446-1-pgaj@cadence.com>
 <20191114055155.20446-3-pgaj@cadence.com>
 <20191114101549.0d6d08f3@collabora.com>
 <20191114102601.745ce03f@collabora.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191114102601.745ce03f@collabora.com>
User-Agent: Mutt/1.5.20 (2009-12-10)
X-Originating-IP: [158.140.32.37]
X-ClientProxiedBy: mailsj7.global.cadence.com (158.140.32.114) To
 mailsj6.global.cadence.com (158.140.32.112)
X-OrganizationHeadersPreserved: mailsj6.global.cadence.com
X-EOPAttributedMessage: 0
X-Forefront-Antispam-Report: CIP:158.140.1.28; IPV:CAL; SCL:-1; CTRY:US;
 EFV:NLI; SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(136003)(376002)(346002)(39860400002)(36092001)(189003)(199004)(386003)(54906003)(50466002)(7696005)(76176011)(2486003)(1076003)(23676004)(86362001)(336012)(107886003)(16586007)(316002)(956004)(6246003)(53416004)(26005)(426003)(58126008)(11346002)(16526019)(4326008)(186003)(486006)(446003)(305945005)(7736002)(7636002)(5660300002)(8936002)(76130400001)(246002)(8676002)(356004)(6666004)(2906002)(6916009)(3846002)(33656002)(55016002)(66066001)(6116002)(6286002)(476003)(70586007)(47776003)(478600001)(70206006)(126002)(5024004)(26826003)(229853002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:SN4PR0701MB3744; H:sjmaillnx2.cadence.com; FPR:;
 SPF:SoftFail; LANG:en; PTR:corp.Cadence.COM; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 16a430de-2298-4ecc-cfd8-08d768f10b61
X-MS-TrafficTypeDiagnostic: SN4PR0701MB3744:
X-Microsoft-Antispam-PRVS: <SN4PR0701MB3744AA2D9BF825BF97835F08C2710@SN4PR0701MB3744.namprd07.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4303;
X-Forefront-PRVS: 02213C82F8
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Apd2XcX5+t094tiVYx2qzOA8SdHbqG50D8eNXRBwt+CU+w/dUcsxK/YOcBxZslg7O0XotVkLPfWB6/IN/738FcRqVNxJsE69/+CRPLfaYjFMIQHVTb2Wf2j6xic3OiQ61tI0oUGWPe+Bo4VHwerqtwPiTjgP7ENw/WcIYz83W95BKgEGAI0lXm7d7gzd4h/er8RjMWoAF9DNh4JlfUr71h8bhghV+Zpv4xLXv7Ys9YVpq2+EHFaQHTbKIpt5UsWuPQFerAdzmTaI6SVU1tm/Gz0JfIaVzaXMnpIfCBxX3BI/9fSDf/4ZHARKAtMMTmGys17B9FfDrCr2a6IJ3wflI/qFJR0ROodYwgEyMmOLiHJeNphIkvcuZtTUz+sE7KxiqULoUhmCQZQU8U9Qyn3L1O8+TUOpEMzLOfS8vLYXr6gniAng44U05XFB2nKE3vcN3kca/54A3vAoDI+nCoWhEA==
X-OriginatorOrg: cadence.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2019 10:54:38.3010 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 16a430de-2298-4ecc-cfd8-08d768f10b61
X-MS-Exchange-CrossTenant-Id: d36035c5-6ce6-4662-a3dc-e762e61ae4c9
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=d36035c5-6ce6-4662-a3dc-e762e61ae4c9; Ip=[158.140.1.28];
 Helo=[sjmaillnx2.cadence.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN4PR0701MB3744
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,18.0.572
 definitions=2019-11-14_03:2019-11-14,2019-11-14 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_check_notspam policy=outbound_check
 score=0 adultscore=0
 spamscore=0 clxscore=1015 impostorscore=0 mlxscore=0 lowpriorityscore=0
 malwarescore=0 priorityscore=1501 bulkscore=0 suspectscore=0
 mlxlogscore=999 phishscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-1910280000 definitions=main-1911140101
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191114_025446_792507_6367FD6C 
X-CRM114-Status: GOOD (  22.94  )
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
Cc: linux-i3c@lists.infradead.org, vitor.soares@synopsys.com,
 rafalc@cadence.com, agolec@cadence.com, bbrezillon@kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org

The 11/14/2019 10:26, Boris Brezillon wrote:
> 
> On Thu, 14 Nov 2019 10:15:49 +0100
> Boris Brezillon <boris.brezillon@collabora.com> wrote:
> 
> > On Thu, 14 Nov 2019 06:51:54 +0100
> > Przemyslaw Gaj <pgaj@cadence.com> wrote:
> > 
> > > Documenting THD_DEL (Data Hold Delay) feature of Cadence I3C
> > > master controller.
> > > 
> > > Signed-off-by: Przemyslaw Gaj <pgaj@cadence.com>
> > > ---
> > >  Documentation/devicetree/bindings/i3c/cdns,i3c-master.txt | 6 ++++++
> > >  1 file changed, 6 insertions(+)
> > > 
> > > diff --git a/Documentation/devicetree/bindings/i3c/cdns,i3c-master.txt b/Documentation/devicetree/bindings/i3c/cdns,i3c-master.txt
> > > index 1cf6182f888c..7d6349354390 100644
> > > --- a/Documentation/devicetree/bindings/i3c/cdns,i3c-master.txt
> > > +++ b/Documentation/devicetree/bindings/i3c/cdns,i3c-master.txt
> > > @@ -21,6 +21,12 @@ Documentation/devicetree/bindings/i3c/i3c.txt for more details):
> > >  - i2c-scl-hz
> > >  - i3c-scl-hz
> > >  
> > > +Optional properties, Cadence I3C master controller specific:
> > > +
> > > +- thd_del: Data Hold Delay. Sets data hold delay (i.e. SDA_OUT data
> > > +	   line will change its value with extra delay that specified
> > > +	   in this register).  
> > 
> > If it's a Cadence specific property, it should be prefixed with 'cdns,':
> > 
> >  - cdns,thd-delay

Ok.

> 
> Oh, and you need to specify the unit. Given the code, I suspect it's in
> clk-cycles, which is not great, since you probably want the delay to
> always be the same no matter the frequency of the clk driving the I3C
> master block.
> 

Actually, this is encoded value. 3 means no delay, 2 - 1x clk delay, 
1 - 2x clk dealy, 0 - 3x clk delay. I should mention about that in the
documentation.

> > 
> > Quick question about this delay, is it related to the IP integration in
> > a SoC or is it board specific? In former case, I'd recommend attaching
> > this piece of information to the compatible and have one compatible per
> > SoC.
> > 

This is spec requirement, slave shouldn't see SDA change before SCL. It
is possible to achive this requirement during SoC physical design. If this
is not the case, you can achive this using thd_del functionality. For
now this is generic driver for our controller. So the question is, what
should I do? Should I add default value for existing compatible and wait
for different SoCs compatibility?

> > > +
> > >  I3C device connected on the bus follow the generic description (see
> > >  Documentation/devicetree/bindings/i3c/i3c.txt for more details).
> > >    
> > 
> 

-- 
-- 
Przemyslaw Gaj

_______________________________________________
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
