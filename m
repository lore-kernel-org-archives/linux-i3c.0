Return-Path: <SRS0=Nh6F=JD=lists.infradead.org=linux-i3c-bounces+linux-i3c=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 794CDC433B4
	for <linux-i3c@archiver.kernel.org>; Tue,  6 Apr 2021 20:06:55 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E5C86613D0
	for <linux-i3c@archiver.kernel.org>; Tue,  6 Apr 2021 20:06:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E5C86613D0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Date:Message-ID:Subject:From:To:
	Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=GADIUci/SvxgsSZlOm8ObM9/NiTbX4wWtnp3g/6JVb8=; b=KnKyrCxNNbEHuH
	1bDA6XtlCTLMx0gYTXxjh+r08YL4djZHxyKOz1zUANXr1NZbRMuzdFSu6Xjc9ODOhRZgHKrctMVes
	wiVZn+ieQVTzT96QgUK8LwLUEX8KhZI4JAhkKdvggmSuZR8WoaONMF5aejTkkukudIEllGR/zsgU5
	N+KeEj76QSG9jWoWTrDCOQM8SK20FCiVFrsxlqmPyft0KZfu5FiZ1UzTsZLteN6ODjr2pwzE5eCG3
	Sr52AaAwug7HkZY6ZQrozDNNWUSw+m9jYvja94O4YYpQ/Ta/B+GxdOmnTgGJDjjHj85t2xO/e3eoh
	gtyQJm5VsnWtRvVRDcfA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lTryP-003NNS-3T; Tue, 06 Apr 2021 20:06:53 +0000
Received: from mga02.intel.com ([134.134.136.20])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lTryD-003NI6-Fy
 for linux-i3c@lists.infradead.org; Tue, 06 Apr 2021 20:06:45 +0000
IronPort-SDR: JxrrkHJQqi07/lU/0XiM8Bkmmjo7d/i1hJ8gB3i3f4IDiDwVSpWqiG4Ph/peoDCaPkGTWYav5m
 iB4wOM4X6nxQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9946"; a="180279040"
X-IronPort-AV: E=Sophos;i="5.82,201,1613462400"; d="scan'208";a="180279040"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Apr 2021 13:04:36 -0700
IronPort-SDR: HDlHm68NejRKIoeLUuQOe+gcZLmGGJh23Lqh0u6SxrIMzLQsgwZ9R1UcKykU+3raD8pdawq+BN
 6/y1Toui4DLQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,201,1613462400"; d="scan'208";a="418485965"
Received: from linux.intel.com ([10.54.29.200])
 by orsmga007.jf.intel.com with ESMTP; 06 Apr 2021 13:04:35 -0700
Received: from [10.91.127.224] (zlukwins-pc.igk.intel.com [10.91.127.224])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by linux.intel.com (Postfix) with ESMTPS id 7EDA95805A1
 for <linux-i3c@lists.infradead.org>; Tue,  6 Apr 2021 13:04:35 -0700 (PDT)
To: linux-i3c@lists.infradead.org
From: zlukwins <zbigniew.lukwinski@linux.intel.com>
Subject: I3C Slave subsystem
Message-ID: <a97b4b6a-d9d1-c692-849e-c7eee3444fdf@linux.intel.com>
Date: Tue, 6 Apr 2021 21:59:47 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210406_210642_462843_C592EDAE 
X-CRM114-Status: UNSURE (   9.66  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-i3c@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-i3c.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-i3c>,
 <mailto:linux-i3c-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-i3c/>
List-Post: <mailto:linux-i3c@lists.infradead.org>
List-Help: <mailto:linux-i3c-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-i3c>,
 <mailto:linux-i3c-request@lists.infradead.org?subject=subscribe>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org

Hi,


Is there any plan for I3C slave subsystem/framework implementation in 
upstream?

Does any one work on this maybe?


Thanks

Zbigniew


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
