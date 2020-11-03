Return-Path: <SRS0=u14M=EJ=lists.infradead.org=linux-i3c-bounces+linux-i3c=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC191C388F2
	for <linux-i3c@archiver.kernel.org>; Tue,  3 Nov 2020 18:07:08 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 496A820757
	for <linux-i3c@archiver.kernel.org>; Tue,  3 Nov 2020 18:07:08 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="1RVUDjbv";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="rrVlj56y"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 496A820757
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=H5e2JyrF9ivHRKrtnSeB/y/N8LzABCstd0BGepN80KI=; b=1RVUDjbvqa5Kfoh9pLTdfa9A8
	XG9DR9JXPXI/D6MsCmdwrm2mcYJuHi4xSeJo2zXMcf/OA7dSb3b2CH3IO9CHTM62DN6hlKKK/TI5u
	8c/yT9c4s/fgZn3pKu0pmYiGt4nmjHGmwJq/4A+Ow5rB1fjYsP3I3z0rybLnheefL2zQzmc0GZvtD
	NRZyjgtA6zwmBPkykpL+Ty6e7S9UB9PEli9gjekHlTaaUIYJGccqz20Xn2XIytVQwI4EfHt1ZCSuY
	3zql+1MIG8BrOZC+3u4u5CiFHqrkHLjm06j96f9uF3CjhmRCKkjn7AKVFUC5bRxmt72VwpQph9nfz
	X9hCcCu6A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ka0i1-0000T9-N4; Tue, 03 Nov 2020 18:07:05 +0000
Received: from mail-oo1-xc35.google.com ([2607:f8b0:4864:20::c35])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kZyAg-0000qY-Ik
 for linux-i3c@lists.infradead.org; Tue, 03 Nov 2020 15:24:31 +0000
Received: by mail-oo1-xc35.google.com with SMTP id l26so4272672oop.9
 for <linux-i3c@lists.infradead.org>; Tue, 03 Nov 2020 07:24:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=N71Zs4qg4W+XUXzJvJITvEfPb9AWspIlQairrp1whfg=;
 b=rrVlj56yk2trpBYSpi4k2yd1xCK2bo7zfyPwMRTDKgj2zJFZf+rsg3l64hS6mNlXsJ
 /lsnCjsBYlscUhZQjxreix9yr1FDyyJ44isM98ku6PfR5nfH8ewfPGTyJoG+z8DaKf3B
 GC0lFyYci0jWLRuivuAjfzCGQfauYD+FIBoJ65Z0ysgZFvM7r9APNUcj/A/ERVF2MbLf
 yty4WBGjCP2WpSIZHr96/NF2lvOu9gyd0kH5dNJE6T16tbnf8/wDcP2ZEnVaZTeW+uv8
 AOywb/DHyLh7Si/JMqeCh4eS5XqaKQQMWQhjlysMgge2i4X83N4I6vLqLPfg4x7OeC6p
 Yirg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=N71Zs4qg4W+XUXzJvJITvEfPb9AWspIlQairrp1whfg=;
 b=uNkclzH8k1aZcLWpIU6nQqjk9dxysHMjy6ZaBNy6ynLCNL9zP9R0caWeGLjWes4JAn
 cjtxoBZOXhv5Oppnnmt4rbqdyxcvkDmtWs+0Vld87ut5vZyTswVykNZI7eE/Imr310rt
 kRjGOBITljNDzZXWq6amfKdZbTwIf1mNA2YLL4ApDK2/gNdw5A5fu/sTVQAFtiy7qNV6
 5cTYmZpTvtXWzw1jTplAA9cpBhK2FH50BzlAnw08RmZePaeQmWVw89ENUEQuy8gGK3OL
 uuo/sAENQXkS1sRDiUw3KfFJlXUUeuUYRhfKBdIBS6RFRrg7T5h07KLz5aPIkMT+M99h
 wBiw==
X-Gm-Message-State: AOAM533l9EY16fG+B7qtFLr/msSv2EqSQ39lTEhVhB/+1ROWzuAR+p+k
 A1eNw57iPrvYf0JouMMJ6pJgeg==
X-Google-Smtp-Source: ABdhPJwU2NP+qjv7T5X33Bc5Qb64pjBRUiEN1Yk0nWz/TQ1GhwOuIu9xrFu+5vjm7/EyqQJ1LvpBNw==
X-Received: by 2002:a4a:6b1a:: with SMTP id g26mr10661391ooc.13.1604417066733; 
 Tue, 03 Nov 2020 07:24:26 -0800 (PST)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net.
 [104.57.184.186])
 by smtp.gmail.com with ESMTPSA id v5sm4548511otb.44.2020.11.03.07.24.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Nov 2020 07:24:25 -0800 (PST)
Date: Tue, 3 Nov 2020 09:24:23 -0600
From: Bjorn Andersson <bjorn.andersson@linaro.org>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Subject: Re: [PATCH 30/33] docs: ABI: cleanup several ABI documents
Message-ID: <20201103004241.GD223412@builder.lan>
References: <cover.1603893146.git.mchehab+huawei@kernel.org>
 <95ef2cf3a58f4e50f17d9e58e0d9440ad14d0427.1603893146.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <95ef2cf3a58f4e50f17d9e58e0d9440ad14d0427.1603893146.git.mchehab+huawei@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201103_102430_749938_454A5A57 
X-CRM114-Status: UNSURE (   7.99  )
X-CRM114-Notice: Please train this message.
X-Mailman-Approved-At: Tue, 03 Nov 2020 13:06:49 -0500
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
Cc: linux-stm32@st-md-mailman.stormreply.com,
 Linux Doc Mailing List <linux-doc@vger.kernel.org>, linux-iio@vger.kernel.org,
 netdev@vger.kernel.org, coresight@lists.linaro.org, linux-pm@vger.kernel.org,
 linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-acpi@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-i3c@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
 linux-fpga@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-media@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org

On Wed 28 Oct 09:23 CDT 2020, Mauro Carvalho Chehab wrote:
[..]
>  .../ABI/testing/sysfs-class-remoteproc        |  14 +-

for this:

Acked-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Thanks,
Bjorn

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
