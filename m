Return-Path: <SRS0=SSUK=ZG=lists.infradead.org=linux-i3c-bounces+linux-i3c=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 059D8C432C3
	for <linux-i3c@archiver.kernel.org>; Thu, 14 Nov 2019 11:35:24 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C4278206DC
	for <linux-i3c@archiver.kernel.org>; Thu, 14 Nov 2019 11:35:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="h5n9BXjw";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=cadence.com header.i=@cadence.com header.b="hrF2DtFT";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=cadence.com header.i=@cadence.com header.b="rbNXP7k2"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C4278206DC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=cadence.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/DSGe8BLxsPLbV5Rrc1zw6Ty+2TYjcFsfri31FCa2xM=; b=h5n9BXjwXJPsdY
	EupctYFvUZFl2vTKJZAF8NaklmIm1GedtFfaPK3GAFOfvK4qoD9tgM/6G45+1qP8X1R1jZb6jR/7o
	M/9M2HNNcCmGYuIa+znjfMVFsMOTpvQdjt4xdrALjZRX+ybGzPdcfYWAUeDMZgWJYGCFfdAalM2s3
	31EI5xKuXtsB95pmNag1c+hTRrdPs+KgkdRSC9eDavNxka6FC7RWroneiKqVkO2Sv4Fc5IusNKt0X
	SxzfSZumhWBJdfWowo5epUdFgyeRK2s1fn/DMaccpUEFW0yWxAnJfT8gB69z7CLmbhjgmj5FWrXhp
	qCqfKleyYn/lvJrkZ/VQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iVDPH-0002UU-Ft; Thu, 14 Nov 2019 11:35:23 +0000
Received: from mx0b-0014ca01.pphosted.com ([208.86.201.193]
 helo=mx0a-0014ca01.pphosted.com)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iVDPC-0002Tz-TS
 for linux-i3c@lists.infradead.org; Thu, 14 Nov 2019 11:35:21 +0000
Received: from pps.filterd (m0042333.ppops.net [127.0.0.1])
 by mx0b-0014ca01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 xAEBYPN2020445; Thu, 14 Nov 2019 03:35:12 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cadence.com;
 h=date : from : to :
 cc : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=proofpoint;
 bh=AEzfxkNpHhEiT1piRg+c56PtBypsLTUENOU8v3nCI/0=;
 b=hrF2DtFTHQ9ZlC1m9kCLEB2J3vMbScUWBnIMfFT5hCVtQqa264MV3zxdgFIqPvIknqPO
 /fjPoWm7iDvviMnagttGAwMdoZpJHwqbbOpFXJeFXxz/RKmExszeC3d6zMiN1UqX1tqU
 IKSeMK9m/2O3ntl9iXcRmBA3FukklYR6PCXo9Ij7KKrsxdJZJTBU7mIOc40ynU3+d6QL
 gRH7zKjaXI0AhmWjTK6Ly5P3QhQTImrRjEI58k2alVl1YU7yYQFMXxjEWFJj8odUOfES
 EdJm2jPfvc+pp9lRrxpJih60tq289pAjwtRsf/e161CgZyTo423fr/vYefxaDKkXazZj jQ== 
Received: from nam02-cy1-obe.outbound.protection.outlook.com
 (mail-cys01nam02lp2053.outbound.protection.outlook.com [104.47.37.53])
 by mx0b-0014ca01.pphosted.com with ESMTP id 2w7pryaemn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 14 Nov 2019 03:35:12 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=deMG48ChrrpmIci+fxWoh259a4KuLgQxVxFRmp3NjXLNBE/AfKWIw30ULnod/YNWITeI4c002yBXkIEW+wq/rnuCEVaKv0mKLLmfi654s2H8Z5n4UCdUYpZcZEhPcxCoOc5yZiLHDkTGKgR5pCwdBTcr1FPWsJQjX3rFuH7QIyJQ0xGIAjpeajLC4dbdxliWIzY/NE5umTmatfLuqTscqb/RbH1idYrz5ckDWOKZmwb6V7cB2YLnewVcO5Liqs8ykALYiTUqzsET9QM8cvucZaloJbQ1q5pez6Fu73d00wFjXLVpvbAi3NOwNz4FkotIZvqTca/lEzfhl4mnvargow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AEzfxkNpHhEiT1piRg+c56PtBypsLTUENOU8v3nCI/0=;
 b=I8wxXJJ00bjgQdHeubxXjPEFkmws/jfL4cIHd+Cgs9l+RcWC9/zVxCs3yw8+u2rGa17umtNcIDJ48IOO8eXQXpvn++M895RhcCjANP9sz7SdeNK+aosoc1LfPf1Zcmhom2S9XvK9UhRA1G8FeM2H7xA2HQOTAFH1kpKpFfpsskwqsdQD8I1RYOBV3HM+BGZUaLO9Qpsw+uelzXI8Bc0bYh3TreCg1NdfUBSKtk5res9spKLvLVx8RY/GB8V0hnQhB60KFvmm9sbJNiNV5+Cx7tRDRzN6V8QaDS3UEHHjaeDIIvAptGneTMC7/su4ChYUd168UHTq/KTXE1zBAN2JhA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 158.140.1.28) smtp.rcpttodomain=lists.infradead.org
 smtp.mailfrom=cadence.com; dmarc=fail (p=none sp=none pct=100) action=none
 header.from=cadence.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cadence.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AEzfxkNpHhEiT1piRg+c56PtBypsLTUENOU8v3nCI/0=;
 b=rbNXP7k2MZcizyN1HO9Cyq4Tr8SLZ3CMT2epUpVYC5vpOlBSTPmWg0kJFVP/MfOblcsk+kZ4YqVfUcjVOyjM/RS39l7FFLUs/gYuEbVtNE98g7w57G9gIzlchzkCZLWNn62u14podrsV2UAzpp1l2QEp8lsG6STW5XdERkeunQk=
Received: from CY1PR07CA0002.namprd07.prod.outlook.com
 (2a01:111:e400:c60a::12) by BN7PR07MB5076.namprd07.prod.outlook.com
 (2603:10b6:408:24::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2451.23; Thu, 14 Nov
 2019 11:35:09 +0000
Received: from DM3NAM05FT053.eop-nam05.prod.protection.outlook.com
 (2a01:111:f400:7e51::209) by CY1PR07CA0002.outlook.office365.com
 (2a01:111:e400:c60a::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2451.22 via Frontend
 Transport; Thu, 14 Nov 2019 11:35:08 +0000
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 cadence.com discourages use of 158.140.1.28 as permitted sender)
Received: from sjmaillnx1.cadence.com (158.140.1.28) by
 DM3NAM05FT053.mail.protection.outlook.com (10.152.98.167) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2474.8 via Frontend Transport; Thu, 14 Nov 2019 11:35:08 +0000
Received: from mailsj6.global.cadence.com (mailsj6.cadence.com
 [158.140.32.112])
 by sjmaillnx1.cadence.com (8.14.4/8.14.4) with ESMTP id xAEBZ70X013754
 (version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=OK);
 Thu, 14 Nov 2019 03:35:07 -0800
X-CrossPremisesHeadersFilteredBySendConnector: mailsj6.global.cadence.com
Received: from global.cadence.com (158.140.32.37) by
 mailsj6.global.cadence.com (158.140.32.112) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Thu, 14 Nov 2019 03:35:05 -0800
Date: Thu, 14 Nov 2019 12:35:02 +0100
From: Przemyslaw Gaj <pgaj@cadence.com>
To: Boris Brezillon <boris.brezillon@collabora.com>
Subject: Re: [PATCH 2/3] dt-bindings: i3c: Document data hold delay feature
Message-ID: <20191114113502.GB8390@global.cadence.com>
References: <20191114055155.20446-1-pgaj@cadence.com>
 <20191114055155.20446-3-pgaj@cadence.com>
 <20191114101549.0d6d08f3@collabora.com>
 <20191114102601.745ce03f@collabora.com>
 <20191114105431.GA27940@global.cadence.com>
 <20191114120908.479d0924@collabora.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191114120908.479d0924@collabora.com>
User-Agent: Mutt/1.5.20 (2009-12-10)
X-Originating-IP: [158.140.32.37]
X-ClientProxiedBy: mailsj7.global.cadence.com (158.140.32.114) To
 mailsj6.global.cadence.com (158.140.32.112)
X-OrganizationHeadersPreserved: mailsj6.global.cadence.com
X-EOPAttributedMessage: 0
X-Forefront-Antispam-Report: CIP:158.140.1.28; IPV:CAL; SCL:-1; CTRY:US;
 EFV:NLI; SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(39860400002)(376002)(346002)(136003)(199004)(189003)(36092001)(8936002)(246002)(47776003)(8676002)(26005)(66066001)(6116002)(3846002)(386003)(23676004)(2486003)(186003)(6916009)(33656002)(16526019)(76176011)(7696005)(5660300002)(11346002)(446003)(76130400001)(956004)(55016002)(53416004)(50466002)(86362001)(476003)(336012)(4326008)(16586007)(6286002)(58126008)(6246003)(486006)(126002)(107886003)(426003)(7736002)(7636002)(305945005)(2906002)(54906003)(26826003)(478600001)(6666004)(356004)(316002)(70206006)(70586007)(1076003)(5024004)(229853002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN7PR07MB5076; H:sjmaillnx1.cadence.com; FPR:;
 SPF:SoftFail; LANG:en; PTR:corp.cadence.com; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: efb8653d-149d-489d-3ccd-08d768f6b3fa
X-MS-TrafficTypeDiagnostic: BN7PR07MB5076:
X-Microsoft-Antispam-PRVS: <BN7PR07MB5076E8D104113C2B10414B0BC2710@BN7PR07MB5076.namprd07.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4714;
X-Forefront-PRVS: 02213C82F8
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ds/G5WyC/xT58T7hkqPmDr1LaZQKE7XHhksx7Ze7P4+tIltjJ9ANd4dtc0KNTSbqU7VAhAJGx1j+nXdEE4ZSZ22+Uxw4tMMCw0RoyBhFZ2vN/LEvSl64eNP2yKLMI0zqwOTPK5qpS/EXWoZ6zfUSfnuok9Bp4OQpaLNWcSJotHuVxIAseR+yLBkqqZM6gNTejnDQ/bOw6d4S43GbH071eUHl3xnpLdCiBYKD7tzpmqv27uoqCwXtjdmv5nzC0nTO4GPTYsFggDExBx7DtYDvBGSltoBdz5tLMWCzu8zR+ozjGCQtVmmmkqXQFvHRRwn75IMABYdvxU0X9SMZbfAWm/DySuS15nz16iyAkXP09X7Twwx03SVRmhT5xZpHpY7HCTl64VwY+6xnaHsnuKhtLI7IzRc7+/5W29e/LEjr+dELVK18wWgpfa06R48ClWmboroz1mbKO4yR0n6FCoteCg==
X-OriginatorOrg: cadence.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2019 11:35:08.5878 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: efb8653d-149d-489d-3ccd-08d768f6b3fa
X-MS-Exchange-CrossTenant-Id: d36035c5-6ce6-4662-a3dc-e762e61ae4c9
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=d36035c5-6ce6-4662-a3dc-e762e61ae4c9; Ip=[158.140.1.28];
 Helo=[sjmaillnx1.cadence.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PR07MB5076
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,18.0.572
 definitions=2019-11-14_03:2019-11-14,2019-11-14 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_check_notspam policy=outbound_check
 score=0
 lowpriorityscore=0 clxscore=1015 suspectscore=0 malwarescore=0 bulkscore=0
 impostorscore=0 priorityscore=1501 spamscore=0 mlxlogscore=999 mlxscore=0
 adultscore=0 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-1910280000 definitions=main-1911140109
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191114_033519_952254_221A2AEF 
X-CRM114-Status: GOOD (  24.90  )
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

The 11/14/2019 12:09, Boris Brezillon wrote:
> EXTERNAL MAIL
> 
> 
> On Thu, 14 Nov 2019 11:54:32 +0100
> Przemyslaw Gaj <pgaj@cadence.com> wrote:
> 
> > The 11/14/2019 10:26, Boris Brezillon wrote:
> > > 
> > > On Thu, 14 Nov 2019 10:15:49 +0100
> > > Boris Brezillon <boris.brezillon@collabora.com> wrote:
> > >   
> > > > On Thu, 14 Nov 2019 06:51:54 +0100
> > > > Przemyslaw Gaj <pgaj@cadence.com> wrote:
> > > >   
> > > > > Documenting THD_DEL (Data Hold Delay) feature of Cadence I3C
> > > > > master controller.
> > > > > 
> > > > > Signed-off-by: Przemyslaw Gaj <pgaj@cadence.com>
> > > > > ---
> > > > >  Documentation/devicetree/bindings/i3c/cdns,i3c-master.txt | 6 ++++++
> > > > >  1 file changed, 6 insertions(+)
> > > > > 
> > > > > diff --git a/Documentation/devicetree/bindings/i3c/cdns,i3c-master.txt b/Documentation/devicetree/bindings/i3c/cdns,i3c-master.txt
> > > > > index 1cf6182f888c..7d6349354390 100644
> > > > > --- a/Documentation/devicetree/bindings/i3c/cdns,i3c-master.txt
> > > > > +++ b/Documentation/devicetree/bindings/i3c/cdns,i3c-master.txt
> > > > > @@ -21,6 +21,12 @@ Documentation/devicetree/bindings/i3c/i3c.txt for more details):
> > > > >  - i2c-scl-hz
> > > > >  - i3c-scl-hz
> > > > >  
> > > > > +Optional properties, Cadence I3C master controller specific:
> > > > > +
> > > > > +- thd_del: Data Hold Delay. Sets data hold delay (i.e. SDA_OUT data
> > > > > +	   line will change its value with extra delay that specified
> > > > > +	   in this register).    
> > > > 
> > > > If it's a Cadence specific property, it should be prefixed with 'cdns,':
> > > > 
> > > >  - cdns,thd-delay  
> > 
> > Ok.
> > 
> > > 
> > > Oh, and you need to specify the unit. Given the code, I suspect it's in
> > > clk-cycles, which is not great, since you probably want the delay to
> > > always be the same no matter the frequency of the clk driving the I3C
> > > master block.
> > >   
> > 
> > Actually, this is encoded value. 3 means no delay, 2 - 1x clk delay, 
> > 1 - 2x clk dealy, 0 - 3x clk delay. I should mention about that in the
> > documentation.
> 
> By clk you mean SCL or the clock driving the I3C master logic (which is
> likely to run at a higher freq)?

Yes, this is the clock driving I3C master logic.

> 
> > 
> > > > 
> > > > Quick question about this delay, is it related to the IP integration in
> > > > a SoC or is it board specific? In former case, I'd recommend attaching
> > > > this piece of information to the compatible and have one compatible per
> > > > SoC.
> > > >   
> > 
> > This is spec requirement, slave shouldn't see SDA change before SCL. It
> > is possible to achive this requirement during SoC physical design. If this
> > is not the case, you can achive this using thd_del functionality. For
> > now this is generic driver for our controller. So the question is, what
> > should I do? Should I add default value for existing compatible and wait
> > for different SoCs compatibility?
> 
> Yes, exactly.

Ok. In that case I don't need dt binding.

-- 
-- 
Przemyslaw Gaj

_______________________________________________
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
