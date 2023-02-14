Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 382B7C64ED8
	for <linux-i3c@archiver.kernel.org>; Wed, 15 Feb 2023 10:56:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=AHp8ZtaV6FhMbI5uRwBmKf4HmonwTQt4M20qo4iLj+g=; b=KTLgjsaDNQy4CcZU3HdQAq11QW
	8bQY/1deVwiHDVODnJNMCLm0BduVIMPOYkSx5qTr3ENQXan4kozqE40Nk8LHfEDd19+CBno1DbHgV
	2Sg2IXCb1rGA9/paDk/Ae/YBGA+ifXPugne36etMYu/ziEqqG56qijLWHLqYHHmDlRI166Vhi41Tb
	ni0eWAZ3YwulSvwIaiqO9uZEaYppA2bO8lFnMkxV1LSkb3Sz1WGXZ9xJ/smnyJz6SNZJSBhD0J65f
	xVZX5r3ttLjpZ46YFOS9subHMKkIdBv73e+GqU7DbqAGMRJdRfVL5yEg8HBjgB+IhN8CC+mCa7jZF
	zpitvQpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pSFSW-005WLa-J7; Wed, 15 Feb 2023 10:56:20 +0000
Received: from mail-yb1-xb49.google.com ([2607:f8b0:4864:20::b49])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pS2mx-003WF7-Mb
	for linux-i3c@lists.infradead.org; Tue, 14 Feb 2023 21:24:37 +0000
Received: by mail-yb1-xb49.google.com with SMTP id b38-20020a25aea6000000b0092aabd4fa90so6730044ybj.18
        for <linux-i3c@lists.infradead.org>; Tue, 14 Feb 2023 13:24:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=hEcVIMvG9yiLGQ7yL2dMbIxVRJjfiraajEKz9YRnmwc=;
        b=stBFlXGMBpLXEMGP+A5HDLlzOo/VqEEpVRD6dPu2S69FUOW1+jatHj+xAlVNyNgRst
         kZ6S6qtOnvmg9SSeL9feCU/tTFzJienpYNF7eQVZiZzcCIZHtgfv77dEXLWhl9bNi8Ro
         O8I903X3OAgKsrs/jjszGFWemIIz1AbLw6PwlWtHMVcxle6+GST8TmXUx38oRxPUXr9w
         lua7lBjPr2ZP8RllYAQG8otCNkUYolCzfH4/A6DqLRNFWR6bzOODH8nWghUnqP37UUAt
         /bq265eUYxH7yhxqy7qHIraS1jl2UzC4uJWTW3BfAvqsHyCq4y1jgXFbnPZscSAa0hef
         i9Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hEcVIMvG9yiLGQ7yL2dMbIxVRJjfiraajEKz9YRnmwc=;
        b=QLOaa8EYWJdeQ92VigMDsiawMmulIZy2JdBOSAd2czRVOIxlTlwgIaGCEubau51yHg
         N3NG43NGbr4cQO5fD/eq+y1N1R9pMQW64LFxKIz6hfLd9F/94C7ZDfwSs1woBfenV0Yh
         6HUcVBh/ILXg1rjOyodTDz2FBBDlE4PY4EJRoDMbX378wqUxvJc/mDSpv8Z6Yo6VvOKC
         YrKpCpC/v462+suEm88K0SL88i94Mf+xjmfUkAY88DtG+L63d3II34egWNKhBKiMd3hd
         nkfLclrFu/MyhzlRaxX3Q67hNDXvH8IllWavidxiLVWq354p80zOWQezYlc1jt5dVHOH
         N/zA==
X-Gm-Message-State: AO0yUKUGfYV2jB0QcE75SkdtnpUJuTl9ug0+dhQjUbX5kmegmR3Er8In
	vCqGv+5fINcpsP41fdQo/ld3hnt8+pmU6DUu
X-Google-Smtp-Source: AK7set/S5jWby/Wn6YLGRxTgowQe+yYBkLF/u4giGyVur6aeQCzfkY36ZoyctyfxI8gIR+cqgZccLmAtuzw69fbx
X-Received: from zenghuchen.c.googlers.com ([fda3:e722:ac3:cc00:2b:7d90:c0a8:2448])
 (user=zenghuchen job=sendgmr) by 2002:a5b:381:0:b0:8f2:bff4:f074 with SMTP id
 k1-20020a5b0381000000b008f2bff4f074mr9162ybp.190.1676409872359; Tue, 14 Feb
 2023 13:24:32 -0800 (PST)
Date: Tue, 14 Feb 2023 16:24:29 -0500
In-Reply-To: <202302141029.2CS1z9de-lkp@intel.com>
Mime-Version: 1.0
References: <202302141029.2CS1z9de-lkp@intel.com>
X-Mailer: git-send-email 2.39.1.581.gbfd45094c4-goog
Message-ID: <20230214212429.1157315-1-zenghuchen@google.com>
Subject: Re: Re: [PATCH] i3c: update dw-i3c-master i3c_clk_cfg function
From: Jack Chen <zenghuchen@google.com>
To: lkp@intel.com
Cc: alexandre.belloni@bootlin.com, jesussanp@google.com, 
	linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org, 
	markslevinsky@google.com, oe-kbuild-all@lists.linux.dev, 
	zenghuchen@google.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230214_132435_810931_D7DDBE08 
X-CRM114-Status: UNSURE (   5.33  )
X-CRM114-Notice: Please train this message.
X-Mailman-Approved-At: Wed, 15 Feb 2023 02:56:19 -0800
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

Thanks Intel kernel test robot. This patch was meant for i3c tree.
And I have submitted a new V2 patch which replaced max with max_t to do the type cast.

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
