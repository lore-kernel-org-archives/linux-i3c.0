Return-Path: <SRS0=Pvy7=ZR=lists.infradead.org=linux-i3c-bounces+linux-i3c=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC639C432C0
	for <linux-i3c@archiver.kernel.org>; Mon, 25 Nov 2019 14:59:45 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7D6D4207FD
	for <linux-i3c@archiver.kernel.org>; Mon, 25 Nov 2019 14:59:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Snz/j46p";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=cadence.com header.i=@cadence.com header.b="BsfLXZuF";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=cadence.com header.i=@cadence.com header.b="p2mhYYOG"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7D6D4207FD
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=cadence.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xED54wG5NhqjJ/Z1BlrDC+KhpLlIEqO5bHbKST+ZN4g=; b=Snz/j46pqgTrax
	LzISexFMJcVF8RKLoyrfJJsnxGkhEVC3deYIfPXBeK9v0i5zxb1JafOb9HSyFpQbySHVc9HRYyHeE
	Cau2pTbWgcHf3h9BJHLyowwoaWApHnJTKw5zwFHIxXnW52MGAW5FD5qn2OukDWTrMfalFzGg1rccY
	SJ1T/lJJMHXtN/jsAXlyrAAr2MYcUQ9H6LV7G059HH7Gk+9Yu6mjo184HMzwUBDEhE6wivAns6IO2
	/LhUJTpZJi37y+A+YteB1szGOdZImqFIe87Hpe/e5509MY+rhbwOnckOX4T6khJyy4IAwEb6gTmam
	o84IBpZGeEW1M27owSyQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iZFq5-0002wL-6P; Mon, 25 Nov 2019 14:59:45 +0000
Received: from mx0b-0014ca01.pphosted.com ([208.86.201.193]
 helo=mx0a-0014ca01.pphosted.com)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iZFq2-0002vl-31
 for linux-i3c@lists.infradead.org; Mon, 25 Nov 2019 14:59:44 +0000
Received: from pps.filterd (m0042333.ppops.net [127.0.0.1])
 by mx0b-0014ca01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 xAPEwMVA020887; Mon, 25 Nov 2019 06:59:35 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cadence.com;
 h=date : from : to :
 cc : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=proofpoint;
 bh=Tf4st1VbgE7aU3k6QNFIbTilUyigiyd9H4HrKRF3vQ8=;
 b=BsfLXZuFnmFBsgEGMZHBMQl+6VX5W5JzcAEoArwf2gL7hY/lUbmplo1rz4nfEQ4ddtT2
 SPTNhgwaQ6eJcQeQglBe4exX3LdGa/h01NkY4EmTnq1tQJzJBPaC1Br998bugdK+Q917
 vJVTF//fXrtSqnVPm27KbeiE92J89v7YWIck3j0HGcSemMGU/lWvYRn79QuEajv10xKR
 K533kOORw9cHO3scK/kQ4gK4wtsk3X8osXKDMhOq0C+E1r5gsvnf/o3+XB44RxhA0v0U
 XlqX6KJYJmd4XZIhUKyjnXsp/jAxTA5taLLeQVmPGa1erQDHBdrchnZy0rjSTEq6/Vvv Nw== 
Received: from nam03-dm3-obe.outbound.protection.outlook.com
 (mail-dm3nam03lp2054.outbound.protection.outlook.com [104.47.41.54])
 by mx0b-0014ca01.pphosted.com with ESMTP id 2wf1807g20-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 25 Nov 2019 06:59:35 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nE3rWnCyxbmIsycG+jyW2TZ62fgsOZmaVYVoP8M5vhWcyjLfGbb5kFQVmiNftP9kv1yqFAvqSSYd86fohHBfUBWgcZ2QcA9S+i/hGaen5fK06pGyiLwHTepUBu9mg3G5yFrWwnj6pJGBDPOh7pp/Mak7Vi9R2jXdVjhHP4utU1ABDZ/bAtXxiZA23ylwsszPW98HmnWVLy5goVcnfmiqvezqXU2I/GDbC1jjxpjkKCFEVSQQUz/0rXwUO6/5w8PFzFmAUxoDBOP4MZKZ1Tk5ji13cJqbcKJ0hMNQZdq93jnXhrARGiHkHPiAwKjjqVsuM2mS3Fyl0Db/3B+Kcn1Hpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Tf4st1VbgE7aU3k6QNFIbTilUyigiyd9H4HrKRF3vQ8=;
 b=hcC4dgo7lHCo6CpnASoIZtLsGfdh78WVmI41nOmnL4ZnK/hZq2XtKCdt7ZzQQyhTyWazRE997/71W6heEQSl5W52s3lGgkGobHJ5JdKp0w87KUjQX5MMPukluDj5ODOQIq6agumdyw9a6s6Z7wgbzRJH4/MYt3NNPzhSuzVv2DgOAr83lK8zGzl4l6MXwwNtga5xhkkJWwwf3mVppoPOchG3EHd53Z0eNPjJsC1/UttgXw8eQxmtqMewBK5/I1SNcB5qaLrUA74QIUms+V4yDG5twBqfvg/esFTC/rAOWKe/uHOmD4PFMh9pJJFDaMgWqGpVSpbf9UuRaFbV2gex1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 158.140.1.28) smtp.rcpttodomain=collabora.com smtp.mailfrom=cadence.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=cadence.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cadence.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Tf4st1VbgE7aU3k6QNFIbTilUyigiyd9H4HrKRF3vQ8=;
 b=p2mhYYOG/7whK3v5GAfr0TKB9cCQehBQHWO/YmANXNYwtWPzS72JGgYXQ9uTgb16XMR8RHEeBHwpPhbeFfq3uxSeotcggI1P5grDuPVBA2G0cbeVhdcmmKFbBi1moTOu64mLKxeGojGq0rG0AMIJQ7WVb8maAY4oILn1A/5CsNc=
Received: from SN4PR0701CA0039.namprd07.prod.outlook.com
 (2603:10b6:803:2d::28) by DM5PR07MB3942.namprd07.prod.outlook.com
 (2603:10b6:4:b5::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2474.17; Mon, 25 Nov
 2019 14:59:33 +0000
Received: from BN8NAM12FT034.eop-nam12.prod.protection.outlook.com
 (2a01:111:f400:fe5b::204) by SN4PR0701CA0039.outlook.office365.com
 (2603:10b6:803:2d::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2474.16 via Frontend
 Transport; Mon, 25 Nov 2019 14:59:33 +0000
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 cadence.com discourages use of 158.140.1.28 as permitted sender)
Received: from sjmaillnx1.cadence.com (158.140.1.28) by
 BN8NAM12FT034.mail.protection.outlook.com (10.13.183.4) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2474.18 via Frontend Transport; Mon, 25 Nov 2019 14:59:32 +0000
Received: from mailsj6.global.cadence.com (mailsj6.cadence.com
 [158.140.32.112])
 by sjmaillnx1.cadence.com (8.14.4/8.14.4) with ESMTP id xAPExUws002846
 (version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=OK);
 Mon, 25 Nov 2019 06:59:30 -0800
X-CrossPremisesHeadersFilteredBySendConnector: mailsj6.global.cadence.com
Received: from global.cadence.com (158.140.32.37) by
 mailsj6.global.cadence.com (158.140.32.112) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Mon, 25 Nov 2019 06:59:29 -0800
Date: Mon, 25 Nov 2019 15:59:26 +0100
From: Przemyslaw Gaj <pgaj@cadence.com>
To: Vitor Soares <Vitor.Soares@synopsys.com>
Subject: Re: I3C Mastership RFC
Message-ID: <20191125145924.GA24606@global.cadence.com>
References: <20191125080220.GA30630@global.cadence.com>
 <CH2PR12MB4216552AAF9BFDCE498837D7AE4A0@CH2PR12MB4216.namprd12.prod.outlook.com>
 <20191125123452.7c2549dd@collabora.com>
 <CH2PR12MB42168C76A833F1401A597E65AE4A0@CH2PR12MB4216.namprd12.prod.outlook.com>
 <20191125115502.GA5777@global.cadence.com>
 <CH2PR12MB421667CED7F6A5FF0299E732AE4A0@CH2PR12MB4216.namprd12.prod.outlook.com>
 <20191125132219.2e45d084@collabora.com>
 <CH2PR12MB421644B0CAB1DEF50675995EAE4A0@CH2PR12MB4216.namprd12.prod.outlook.com>
 <20191125140936.47f3d479@collabora.com>
 <CH2PR12MB4216F1775A4F133EF845EC01AE4A0@CH2PR12MB4216.namprd12.prod.outlook.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CH2PR12MB4216F1775A4F133EF845EC01AE4A0@CH2PR12MB4216.namprd12.prod.outlook.com>
User-Agent: Mutt/1.5.20 (2009-12-10)
X-Originating-IP: [158.140.32.37]
X-ClientProxiedBy: mailsj7.global.cadence.com (158.140.32.114) To
 mailsj6.global.cadence.com (158.140.32.112)
X-OrganizationHeadersPreserved: mailsj6.global.cadence.com
X-EOPAttributedMessage: 0
X-Forefront-Antispam-Report: CIP:158.140.1.28; IPV:CAL; SCL:-1; CTRY:US;
 EFV:NLI; SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(346002)(376002)(39860400002)(136003)(189003)(36092001)(199004)(43544003)(186003)(54906003)(336012)(16586007)(50466002)(246002)(5660300002)(4326008)(23676004)(2486003)(16526019)(70586007)(70206006)(8936002)(7696005)(8676002)(76130400001)(76176011)(7116003)(956004)(55016002)(33656002)(66066001)(316002)(6916009)(386003)(53416004)(14444005)(229853002)(478600001)(7736002)(3846002)(26826003)(6116002)(7636002)(1076003)(6246003)(2906002)(58126008)(86362001)(426003)(305945005)(356004)(446003)(11346002)(26005)(6286002)(6666004)(47776003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR07MB3942; H:sjmaillnx1.cadence.com; FPR:;
 SPF:SoftFail; LANG:en; PTR:corp.Cadence.COM; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9a9eefcf-4cfc-47a5-f50c-08d771b8149f
X-MS-TrafficTypeDiagnostic: DM5PR07MB3942:
X-Microsoft-Antispam-PRVS: <DM5PR07MB3942EE93D0F4A630397D9EE6C24A0@DM5PR07MB3942.namprd07.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-Forefront-PRVS: 0232B30BBC
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: PrGinTEms08UNlocr/18FTZJQ/H3DVuDPSyUuAA97mmxw+zJP3F0w4fRMC63lRNGLjm5l7VHawqFNITG6O28/JCFiIjeiEXiIfZvhnXAfH6VgbteCYkx1720xsQOmgrIYozWgjbKetwjpFeaQwReZlCp9hDPAIJDuhqzcmLPMbB8oIcG/t+diQ4XrVrHZKAA/GMhC9t93uLO55PIWdmDH6QtEdpLI56Cl1xu/OY2GV4zfn+Xj3A+nUUs4V8t3A97mQL9NuOF2EaSpEn7gOfnGx27um/1zpx/JZip4LAGBNiJhFerxQjtzfuZAnMam5lKoVwGOU2qSI7BNUaviXNDk1lpyo4s6+Er1fwK6XJW+LtZlgVP/1K0Nbj0IM1xsP6+e48LIqIt05HxtwNBrdwZC5MalFTTSE/zzy/64aFdsbYhbT/Pu35T0nc94eVauWu5WpVsYAMExZeBRjiR0RdF6w==
X-OriginatorOrg: cadence.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2019 14:59:32.8812 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9a9eefcf-4cfc-47a5-f50c-08d771b8149f
X-MS-Exchange-CrossTenant-Id: d36035c5-6ce6-4662-a3dc-e762e61ae4c9
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=d36035c5-6ce6-4662-a3dc-e762e61ae4c9; Ip=[158.140.1.28];
 Helo=[sjmaillnx1.cadence.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR07MB3942
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,18.0.572
 definitions=2019-11-25_03:2019-11-21,2019-11-25 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_check_notspam policy=outbound_check
 score=0
 lowpriorityscore=0 bulkscore=0 adultscore=0 impostorscore=0 malwarescore=0
 clxscore=1015 mlxlogscore=999 mlxscore=0 suspectscore=0 phishscore=0
 spamscore=0 priorityscore=1501 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-1910280000 definitions=main-1911250136
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191125_065942_608576_999EDFA3 
X-CRM114-Status: GOOD (  24.87  )
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
 Boris Brezillon <boris.brezillon@collabora.com>,
 "bbrezillon@kernel.org" <bbrezillon@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org

The 11/25/2019 14:27, Vitor Soares wrote:
> 
> From: Boris Brezillon <boris.brezillon@collabora.com>
> Date: Mon, Nov 25, 2019 at 13:09:36
> 
> > On Mon, 25 Nov 2019 13:00:17 +0000
> > Vitor Soares <Vitor.Soares@synopsys.com> wrote:
> > 
> > > > > > > > I'm pretty sure we solved that already (that's what
> > > > > > > > i3c_master_acquire_bus_ownership() calls are supposed to take care of).
> > > > > > > > Can you be a bit more specific? What makes you think the master might
> > > > > > > > not be in control of the bus when i3c_dev_do_priv_xfers_locked() is
> > > > > > > > called?    
> > > > > > > 
> > > > > > > You are assuming that after i3c_master_acquire_bus_ownership() return, 
> > > > > > > secondary master already owns the bus. Main master can ack the MR request 
> > > > > > > and not send the CETACCMST immediately.
> > > > > > >    
> > > > > > 
> > > > > > In Cadence HC driver, I'm waiting for GETACCMST longer, polling the
> > > > > > status and after I exit from ->request_mastership(), I'm the bus owner.
> > > > > > If not, error exit code is returned and we can't make the transfers.
> > > > > > Are you able to implement the same behavior?    
> > > > > 
> > > > > You can assume everyone will do in that way. What happen if you receive a 
> > > > > request or an information from current master?  
> > > > 
> > > > We have this ->request_mastership() method so controllers that have
> > > > this logic (MR+wait(GETACCMST) automated can still interface with the
> > > > subsystem.   
> > > 
> > > I can also poll the GETACCMST but we are assuming nothing will happen 
> > > between MR and GETACCMST.
> > 
> > Nothing coming from the master that tries to acquire the bus, yes.
> > Nothing coming from the current master, no, and that shouldn't be a
> > problem as long as those operations don't involve acquiring bus->lock.
> > And if some of those operation involve acquiring the lock (I'd still
> > need to understand which operation that would be) they'll just be
> > delayed/rejected.
> 
> You are assuming this is straight forward which is not the case. Between 
> MR and GETACCMST may happen everything as in a Master-Slave topology.
> For me, poll the controller to check when GETACCMST arrive and lock 
> everything is not a solution.
> 

I understand your point. I'm sure that one of my patchset supported
your use case. I introduced the function which lets the subsystem
takeover the bus. Even when we receive GETACCMST without requesting
mastership. I assume you are trying do the same thing now.

The only thing I remember when you reviewed my patch, you wanted to pass
device list to that function.

> > 
> > > 
> > > > If your controller handles the MR/GETACCMST separately, it
> > > > shouldn't be hard to implement, and we can even provide an helper if
> > > > people end up duplicating the code.  
> > > 
> > > I already implement a callback in my code so each controller be able to 
> > > do their stuff in that in request/deliver mastership.
> > 
> > Can you share some details here? What would those callbacks supposed to
> > do and when would they be called?
> 
> My understanding is that different controllers may have different ways to 
> deliver the bus ownership hence I implemented that.
> 
> Best regards,
> Vitor Soares

-- 
-- 
Przemyslaw Gaj

_______________________________________________
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
