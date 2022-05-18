Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2AC57C433EF
	for <linux-i3c@archiver.kernel.org>; Wed, 18 May 2022 12:28:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	MIME-Version:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=X+5EIPFPJYDLaAquuYjAFUvd/04y1T6Y4HE3detFkaE=; b=OLO
	z8fpHhchtouIoV25Uhzm91egOKhT6SV/vvWLc5V4HMJWRbmcJ4gL5hAjqb25FCHELD9Xp6++ohITv
	prpoKvobrW5LSYc89e4eTIT2VD1/k905OnGUl4GefvtyjZ/xLrtmgxKunfxzVQlWkX3k55z4sh/yt
	Fr4TKV9y8DCMY21i4aRE7gkxepqHIAhZypkhSMW7gu9kBHG7CFiXNlrvtICdeLr9iAoXupuGn+f+z
	rISsNCu80W6vXh111mZQ5Fs4FdGTVD5/gvnxIDcJuw7KLt4skGpOPoCBSd1XbHZKVc2eACybZ8ll5
	fn8Xw7O/F9HxzjTFijWBW5cjWS2AU8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nrImg-0020qE-ES; Wed, 18 May 2022 12:28:10 +0000
Received: from mail-oa1-x2c.google.com ([2001:4860:4864:20::2c])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nrImd-0020mC-At
 for linux-i3c@lists.infradead.org; Wed, 18 May 2022 12:28:08 +0000
Received: by mail-oa1-x2c.google.com with SMTP id
 586e51a60fabf-e5e433d66dso2407806fac.5
 for <linux-i3c@lists.infradead.org>; Wed, 18 May 2022 05:28:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:from:date:message-id:subject:to;
 bh=ErgpxhH5DBk+6oGsHgLt0SIhgffBEZvBh59nWhOwHDo=;
 b=Ctn/VSHeOxqV6kkGDNPy/5m5+PuzC3NinGIDR42t4a6LSJzNeTYq8ozJMElteZPL1q
 VXUPnABRtKaxehA07bwP4XXognPhCxId5TchMVpwewpBjkIp3hDQeY2ObsNjn04SVFs+
 diBwgMWehl0zRGiHULxQyEGjoQ1h/ejG0oHDpik2h4qlzTdJx87xJ96Mmfvnr49Ya91s
 B3dcXsbk+nlrAJz8cOHWh921BtX/PRKodsGIrgzTjXEFsN3qONobVeR9sS0xgXYQTsv8
 f+M6ErbEXcUT/02eOpfl3QtMkTePm8/lK/5D6DTQxi/aYYLhhgWshh2hpujHfasOue8c
 kTtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=ErgpxhH5DBk+6oGsHgLt0SIhgffBEZvBh59nWhOwHDo=;
 b=GFuBjmslSY3l/icAYqfV2vo+D+/BpZmdfNKHpQIsOgcKuh2BY9uTInDBrpviEUrD6n
 lUbZVeQOnjwZ2n/i8q4jJ+Bx4UVYnR/7p1HKPfoI3oTi3Fqmk4NWNmSx5w/2b5B7om0r
 t6v5djk5wW/D2agQFobi9532lw2yB4YC4ngv1N6saK3mhGjc3XJixtc0w4+cqJv37m5K
 qG9oNnb3m7fa7XrlqtdOuOC5odxlmjR08yIGqfFZd2o6KDm/yIS0z971XGLiM5JvUmrf
 f/qwIoZD0TR76Pnf9KY1bvztjjOd3BjofSfBWca/L1MMUD45tPU5clo5Pb46xD49AX1m
 UHRQ==
X-Gm-Message-State: AOAM530bipzdl/xeYA1+kLHHfsViKv9/M35cMdcC1+cZxFbdiAdXj/ch
 pr6K/7hyADhqWJx7WpQfa7GEhWSoLEen3iSHkWPo7PvyTXQ=
X-Google-Smtp-Source: ABdhPJwKifZo+MnMXjN+OrCQA98TuxunfUU+6NCnWV7H4u3S15Us6jGqsODxhOXpfFHMSxD7roQRNoo5Ut9L0ebTsZI=
X-Received: by 2002:a05:6870:830a:b0:ee:1586:1009 with SMTP id
 p10-20020a056870830a00b000ee15861009mr15510556oae.271.1652876882758; Wed, 18
 May 2022 05:28:02 -0700 (PDT)
MIME-Version: 1.0
From: Shubhrajyoti Datta <shubhrajyoti.datta@gmail.com>
Date: Wed, 18 May 2022 17:57:51 +0530
Message-ID: <CAKfKVtGFR=pduExLM+CGyekexJDWoudRk5h9X10R=5Nn=n3_LA@mail.gmail.com>
Subject: DWC_mipi_i3c slave
To: linux-i3c@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220518_052807_423385_89AD22E1 
X-CRM114-Status: UNSURE (   6.49  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org

Hi ,

The DWC_mipi_i3c in slave mode has a bug that it ignores the first transaction.
So in case this is the only device in the bus it will not respond to ENTDAA.

The slave expects the master to retry.

The slave expects the device tree to know the no of slaves in the
system and retry.
Or retry regardless.

I did not find any retry.

Am I missing something.

How can we support such peripherals.

Thanks for suggestions.

With Regards,
Shubhrajyoti

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
