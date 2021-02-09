Return-Path: <SRS0=Jn7S=HL=lists.infradead.org=linux-i3c-bounces+linux-i3c=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC149C433E6
	for <linux-i3c@archiver.kernel.org>; Tue,  9 Feb 2021 10:57:52 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 35EBB64E26
	for <linux-i3c@archiver.kernel.org>; Tue,  9 Feb 2021 10:57:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 35EBB64E26
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=oracle.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:To:From:Date:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=SX5bnVB3B3uK3X7SaxPvGbKdxXIfUsM47EEXfiJS5Tc=; b=0Xc7u+2t/DAM29abRo7pwTFVzY
	EakcSX4eCkckcc6/b6fbdx845CBpl4PxT06YIM5B9xtKWhjgOuori12eDVhZBZ1GbFoif2kLF92ur
	6MiNYShM1HcmcSRH/vr9rU8uM/Ioj+5hcqGyz/bp22L7dbLwiBVWW64aPQe+ttvKesaDYWEqdjb36
	VU46QG9+mo2pB3OtxaohNAFOiHI1WSN/TaW4YCM1IJfhU+HJNlS23lH8GhGePHSHs6gGe0Mlphbwm
	ufI0iYw4xJX+I1PgzFjb0Ll9I8AkJ6dkwqnwTFkzbn/XyLthWfJxd27euMie8dAmMtqYiat2GJcsW
	ONASwWjQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l9QiN-0005Rh-1Y; Tue, 09 Feb 2021 10:57:51 +0000
Received: from userp2120.oracle.com ([156.151.31.85])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l9QiG-0005P5-WA
 for linux-i3c@lists.infradead.org; Tue, 09 Feb 2021 10:57:46 +0000
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
 by userp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 119ArgUC095115;
 Tue, 9 Feb 2021 10:57:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : mime-version : content-type; s=corp-2020-01-29;
 bh=AU+hddJSyW2AsNTO71PrP2ra0zNBA6js6Qkb2TCPEUc=;
 b=r+/U0PGHpr8ai9D85sdoB+nhtek7ZdTvFg6V2qXOHV0itxgmC8kbpKKBW/qHWkODgPB9
 G1OBAh7sUK7RrH0zEoeij+NneGHpajO4F+MiK+Pp23vkJfSvjVns45J7MUm69MfWv98r
 6CJgKxMG2pGNy9i/hycbkAQDhwA6Ee6M/vQ7mcBo3oaM14Wexe9uAmpBUK8ZQQgVA044
 aMIZz6v1/3XyPJ6KMoQArTCgcjecgn7isI6g5sLLkerOz/oPi7fi5SIXkTndoWowtSDZ
 0jIBNlZNeEfa32/vTOJNejg3cBa+MYD96dyh+9/gGAmBcLaCSRJXVHLfV4mC9zvxeYIx dg== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by userp2120.oracle.com with ESMTP id 36hkrmy0rr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 09 Feb 2021 10:57:39 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 119AsbZF161359;
 Tue, 9 Feb 2021 10:57:38 GMT
Received: from aserv0122.oracle.com (aserv0122.oracle.com [141.146.126.236])
 by userp3020.oracle.com with ESMTP id 36j4vr5qwq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 09 Feb 2021 10:57:38 +0000
Received: from abhmp0017.oracle.com (abhmp0017.oracle.com [141.146.116.23])
 by aserv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 119AvY3p005060;
 Tue, 9 Feb 2021 10:57:37 GMT
Received: from mwanda (/102.36.221.92) by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Tue, 09 Feb 2021 02:57:33 -0800
Date: Tue, 9 Feb 2021 13:57:28 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: miquel.raynal@bootlin.com
Subject: [bug report] i3c: master: svc: Add Silvaco I3C master driver
Message-ID: <YCJqmKHvBWFVIudi@mwanda>
MIME-Version: 1.0
Content-Disposition: inline
X-Proofpoint-IMR: 1
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9889
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=22
 adultscore=0
 mlxlogscore=708 mlxscore=0 suspectscore=0 malwarescore=0 phishscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2102090057
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9889
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0
 malwarescore=0
 priorityscore=1501 bulkscore=39 spamscore=0 impostorscore=0 mlxscore=0
 suspectscore=0 mlxlogscore=645 adultscore=0 clxscore=1011
 lowpriorityscore=39 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2102090056
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210209_055745_302997_DA5304A5 
X-CRM114-Status: GOOD (  14.77  )
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

Hello Miquel Raynal,

The patch dd3c52846d59: "i3c: master: svc: Add Silvaco I3C master
driver" from Jan 21, 2021, leads to the following static checker
warning:

	drivers/i3c/master/svc-i3c-master.c:394 svc_i3c_master_ibi_work()
	error: uninitialized symbol 'dev'.

drivers/i3c/master/svc-i3c-master.c
   364          status = readl(master->regs + SVC_I3C_MSTATUS);
   365          ibitype = SVC_I3C_MSTATUS_IBITYPE(status);
   366          ibiaddr = SVC_I3C_MSTATUS_IBIADDR(status);
   367  
   368          /* Handle the critical responses to IBI's */
   369          switch (ibitype) {
   370          case SVC_I3C_MSTATUS_IBITYPE_IBI:
   371                  dev = svc_i3c_master_dev_from_addr(master, ibiaddr);
   372                  if (!dev)
   373                          svc_i3c_master_nack_ibi(master);
   374                  else
   375                          svc_i3c_master_handle_ibi(master, dev);

"dev" only valid on this path.

   376                  break;
   377          case SVC_I3C_MSTATUS_IBITYPE_HOT_JOIN:
   378                  svc_i3c_master_ack_ibi(master, false);
   379                  break;
   380          case SVC_I3C_MSTATUS_IBITYPE_MASTER_REQUEST:
   381                  svc_i3c_master_nack_ibi(master);
   382                  break;
   383          default:
   384                  break;
   385          }
   386  
   387          /*
   388           * If an error happened, we probably got interrupted and the exchange
   389           * timedout. In this case we just drop everything, emit a stop and wait
   390           * for the slave to interrupt again.
   391           */
   392          if (svc_i3c_master_error(master)) {
   393                  if (master->ibi.tbq_slot) {
   394                          data = i3c_dev_get_master_data(dev);
                                                               ^^^
Dereferenced here.

   395                          i3c_generic_ibi_recycle_slot(data->ibi_pool,
   396                                                       master->ibi.tbq_slot);
   397                          master->ibi.tbq_slot = NULL;
   398                  }
   399  
   400                  svc_i3c_master_emit_stop(master);
   401  
   402                  goto reenable_ibis;
   403          }
   404  
   405          /* Handle the non critical tasks */

regards,
dan carpenter

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
