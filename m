Return-Path: <SRS0=sbX1=HS=lists.infradead.org=linux-i3c-bounces+linux-i3c=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6B1AC433E0
	for <linux-i3c@archiver.kernel.org>; Tue, 16 Feb 2021 18:44:45 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A42CE64E10
	for <linux-i3c@archiver.kernel.org>; Tue, 16 Feb 2021 18:44:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A42CE64E10
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=oracle.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=pjr3d3n/vZZwci4EMh9oD4ZnVnqp+rp/ITgrqEhuqyg=; b=Jq15sVNxubnSZIWOdCzR7RmTR
	OC5tj8O9SYHIHnbIlFGehkr08FfUJIB+ReaXoF0FCbtbLZcUbVu2q8dGq7zPYKa1ki5whtFm3ApCW
	dlVn8e4EuECk2nhjpHSoJ8LbQT2B0V5GroI2g4N67Wle8hd5Iggo4AlhvCNla0fM1qUBEAWXm87p5
	sIsrTsLbLFP2t7dhPW4YdwpUUearYroCmYHH+JcqKi79UQkXSGMJ+yxAVX2WUS+Wu6X26pmZQ8D67
	XHBJoPbOmV4kEWYDZcmLP7Zd/qWKRapc+vKX8O1S6qnHCI8Wy9Z5J/TPbfZ5HdGLCJiJublZmL2tv
	d6ew27iYg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lC5L2-0002Ru-QP; Tue, 16 Feb 2021 18:44:44 +0000
Received: from aserp2120.oracle.com ([141.146.126.78])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lC5L0-0002RR-9Z
 for linux-i3c@lists.infradead.org; Tue, 16 Feb 2021 18:44:43 +0000
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
 by aserp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 11GIhb7n049997;
 Tue, 16 Feb 2021 18:44:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=corp-2020-01-29;
 bh=dfF+D3phb50DQbB+82d6xQrqAxJqt8JSLXrzNqRmaHQ=;
 b=gXjywmNs/BpeFlll5Iq5obEFulFlBXKvdtSP7NYhq0qWhdQsEzLJIshX4miv3eXnpxtd
 fENvuwXrl/zXbrnVAgYLMEmZvmX3u1DB7HP8P08E8Ib/weSdSZhJGNdIJTNG5DlmmC+w
 kSLzVmTcoPF7gxJYcg47NakFIGS9EuuErMahLyPgl2zjnIVjnPUuMBLPQt6Hez9lT9Lm
 jlODDWqBvSgC3YiOjWNvIP/LyFlk9uyMtwQSkEJmkRIkDhApUQZUNRJYwQ8HGF/kee4d
 mccl8RCLNPzktbXSRUYVzqjqlmRgy5zpnP33Ix4nkvxkm6DI+glsMKoXU77tIxJ0pgFb aQ== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by aserp2120.oracle.com with ESMTP id 36pd9a7cde-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 16 Feb 2021 18:44:33 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 11GIQKmh007160;
 Tue, 16 Feb 2021 18:44:32 GMT
Received: from aserv0122.oracle.com (aserv0122.oracle.com [141.146.126.236])
 by aserp3030.oracle.com with ESMTP id 36prbnj8ha-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 16 Feb 2021 18:44:32 +0000
Received: from abhmp0011.oracle.com (abhmp0011.oracle.com [141.146.116.17])
 by aserv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 11GIiPae026362;
 Tue, 16 Feb 2021 18:44:30 GMT
Received: from kadam (/102.36.221.92) by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Tue, 16 Feb 2021 10:44:25 -0800
Date: Tue, 16 Feb 2021 21:44:19 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Subject: Re: [bug report] i3c: master: svc: Add Silvaco I3C master driver
Message-ID: <20210216184419.GH2222@kadam>
References: <YCJqmKHvBWFVIudi@mwanda>
 <20210216162101.4bc23c46@xps13>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210216162101.4bc23c46@xps13>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-IMR: 1
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9897
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 spamscore=0 mlxscore=0
 phishscore=0 adultscore=0 bulkscore=0 mlxlogscore=999 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2102160155
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9897
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 clxscore=1015
 impostorscore=0
 mlxscore=0 phishscore=0 mlxlogscore=999 spamscore=0 bulkscore=0
 priorityscore=1501 malwarescore=0 suspectscore=0 adultscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2102160156
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210216_134442_470787_8F4BDEE7 
X-CRM114-Status: GOOD (  24.34  )
X-BeenThere: linux-i3c@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-i3c.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-i3c>,
 <mailto:linux-i3c-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-i3c/>
List-Post: <mailto:linux-i3c@lists.infradead.org>
List-Help: <mailto:linux-i3c-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-i3c>,
 <mailto:linux-i3c-request@lists.infradead.org?subject=subscribe>
Cc: linux-i3c@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org

On Tue, Feb 16, 2021 at 04:21:01PM +0100, Miquel Raynal wrote:
> Hi Dan,
> 
> Thanks for the report.
> 
> Dan Carpenter <dan.carpenter@oracle.com> wrote on Tue, 9 Feb 2021
> 13:57:28 +0300:
> 
> > Hello Miquel Raynal,
> > 
> > The patch dd3c52846d59: "i3c: master: svc: Add Silvaco I3C master
> > driver" from Jan 21, 2021, leads to the following static checker
> > warning:
> > 
> > 	drivers/i3c/master/svc-i3c-master.c:394 svc_i3c_master_ibi_work()
> > 	error: uninitialized symbol 'dev'.
> > 
> > drivers/i3c/master/svc-i3c-master.c
> >    364          status = readl(master->regs + SVC_I3C_MSTATUS);
> >    365          ibitype = SVC_I3C_MSTATUS_IBITYPE(status);
> >    366          ibiaddr = SVC_I3C_MSTATUS_IBIADDR(status);
> >    367  
> >    368          /* Handle the critical responses to IBI's */
> >    369          switch (ibitype) {
> >    370          case SVC_I3C_MSTATUS_IBITYPE_IBI:
> >    371                  dev = svc_i3c_master_dev_from_addr(master, ibiaddr);
> >    372                  if (!dev)
> >    373                          svc_i3c_master_nack_ibi(master);
> >    374                  else
> >    375                          svc_i3c_master_handle_ibi(master, dev);
> > 
> > "dev" only valid on this path.
> > 
> >    376                  break;
> >    377          case SVC_I3C_MSTATUS_IBITYPE_HOT_JOIN:
> >    378                  svc_i3c_master_ack_ibi(master, false);
> >    379                  break;
> >    380          case SVC_I3C_MSTATUS_IBITYPE_MASTER_REQUEST:
> >    381                  svc_i3c_master_nack_ibi(master);
> >    382                  break;
> >    383          default:
> >    384                  break;
> >    385          }
> >    386  
> >    387          /*
> >    388           * If an error happened, we probably got interrupted and the exchange
> >    389           * timedout. In this case we just drop everything, emit a stop and wait
> >    390           * for the slave to interrupt again.
> >    391           */
> >    392          if (svc_i3c_master_error(master)) {
> >    393                  if (master->ibi.tbq_slot) {
> >    394                          data = i3c_dev_get_master_data(dev);
> >                                                                ^^^
> > Dereferenced here.
> 
> Only svc_i3c_master_handle_ibi() populates master->ibi.tbq_slot, so dev
> will only be dereferenced if svc_i3c_master_handle_ibi() was executed,
> which only happens if dev is valid.
> 
> I don't think there is a risk here, however if robots really are
> unhappy we might add an extra sanity level by checking dev explicitly,
> but this would be purely useless on a practical point of view.

Nah.  I think this works.  It's fine.  Don't do things just to make the
robots happy.

regards,
dan carpenter


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
