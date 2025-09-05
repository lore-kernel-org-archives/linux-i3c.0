Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 034B2CA0FED
	for <linux-i3c@archiver.kernel.org>; Fri,  5 Sep 2025 14:32:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RyKYmmA4vZhpxXQDuXACA1+uugm0nMFrYjKthG6Dviw=; b=xPW0J3zfWPBnYp
	tQS7yV5uHaX/jaimXbxaByGbbHntYpOx+xhyYzL4A9avg67ERpgFmZo4UImwEbONZ4Q+pLCJdFU0c
	M2LPCmIy1XVH8qtq3gIoI8kKDafITCuLOpYOUsDyoUBr1ziWH8fWOv1rWjdy20UDvQFobYyQq3mDw
	rw4ZJXttOYsElT5mkv3kFvK1E1OKlCOmonqzAR9kuO7tr5DKe3H1ojl+OlxRsP67nQWI4NAHE3+KX
	WZ2AzWtkE5JSuTYTXUVxnma5sTUEOiAJJ7CcuNk5ruBN0goUhDdtO2oke783dEdMZ9SAJiQurLf1l
	3hnp5lHAjKuCZD8DusGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuXUc-00000002JVp-2hHD;
	Fri, 05 Sep 2025 14:32:46 +0000
Received: from zeus03.de ([194.117.254.33] helo=mail.zeus03.de)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuSVl-00000000eac-0uBl
	for linux-i3c@lists.infradead.org;
	Fri, 05 Sep 2025 09:13:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=5LSE
	6ANE3uJW4uelTDzCSpeyIyKkO4Qy1LzDzN9WI40=; b=FIF+BzycG/Q0f2/R7Z5P
	e/ie+w9gyZR/ij+cJ8acWWurs1Rs1pINqNEIcvEQj5eKA2CsV/SvMHIx52dJvbcm
	9Zc9joLqMzzBI5p6kzYGupECeZeJZ9hILS3ipG1YZ2KUZs9wEt1An/PizAR2i5Az
	Gef86Mz36ukrzMb/sfjR/Fdloi4XQHOyHduIcjpf/MK2RmbqlMJ5foxZCV5l1yHN
	NiCNE6PFK6wr1IMPjFN8JJlpsqZUcmAntLZOh6WH2mCPhs1ETt4iOr2EJ4j0qHmw
	f1lOPenL3jUHqlP8t8H/dFiEB3lsqA1wnKFFjJRyyy6uj9sWfqw5DqB0KBMiQcvy
	Ew==
Received: (qmail 3980910 invoked from network); 5 Sep 2025 11:13:33 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 5 Sep 2025 11:13:33 +0200
X-UD-Smtp-Session: l3s3148p1@GBaCQAo+YpYgAwDPXxPDAOCjMSL5jkIv
Date: Fri, 5 Sep 2025 11:13:32 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Jarkko Nikula <jarkko.nikula@linux.intel.com>
Cc: linux-i3c@lists.infradead.org,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Frank Li <Frank.Li@nxp.com>,
	Boris Brezillon <bbrezillon@kernel.org>
Subject: Re: [PATCH] i3c: Fix default I2C adapter timeout value
Message-ID: <aLqpvAb83UrMrkH4@shikoro>
References: <20250904124226.837639-1-jarkko.nikula@linux.intel.com>
 <aLmfY3zznNHPvH4q@shikoro>
 <aefc2b10-b014-49df-85c8-e7508935c19a@linux.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <aefc2b10-b014-49df-85c8-e7508935c19a@linux.intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250905_021338_126284_2316223B 
X-CRM114-Status: UNSURE (   7.42  )
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


> I didn't Cc stable since I don't think any of your patches cause any other
> issue than extra long wait in case of I2C transfer error on configurations
> where CONFIG_HZ is less than 1000 but now I'm unsure should it be Cc'ed?

Hmm, while it is not really a bug, it is a regression because my patch
reveals the wrong initialization. Maybe it is better to CC stable, at
least for versions containing my patch?


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
