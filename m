Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A078C79FB6
	for <linux-i3c@archiver.kernel.org>; Sat, 12 Sep 2026 11:12:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SfaigyHxagsVwkx242JyqbE6ferFvDwg/xdA7T1hIrU=; b=uJnPjKO74li2zi
	wzV+FulN0CwSQ2Q4xq/1VPOrqBkokKe516vZ2Ju1ZXFvymEw3nyG7PgAV5z8xpbeT/Gv29Pw9/jl/
	VsrP48HIdj3j4E+T3xuRehKm5BvCvlGxUX2p5fQ2lzJoVGZLgfinVXZT9eiA4AB4tmN9LHFzmxzp1
	zIjrCH2cnZIBuNlMmspP5RAH3envyT8iSxNQt+NHVpMqyKk2XwJLNqoDHG1AZKSmIRQ9s+2qlh2pN
	1nBzJETrrp68erHzjHXn0vPj7OwvoS5jKKkjhI04biMVz7O3D1yNHoTZDWLhccpSo8CPE8R5fmoib
	kn6k8o+AnBbS23VBUKbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5LfC-00000000oc9-3iru;
	Sat, 12 Sep 2026 11:12:54 +0000
Received: from zeus03.de ([194.117.254.33] helo=mail.zeus03.de)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5Lf7-00000000obe-27yX
	for linux-i3c@lists.infradead.org;
	Sat, 12 Sep 2026 11:12:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=97bh
	hKMklXsw2yqKWEvcfcOq9VlutyKT3Iaes2zDJNc=; b=XJaWFpm9w4ZrmxkpcMf8
	iQq0H2NwptLuHJ0CRTgrTiXxMarCZH767mle4CFo3vz2UDmwvXDuU4vXBMMc6koP
	KqApJTvK6Qnzg68Ilus2TAm8OKEp4fIZb8E5zoSqeSRBb5del/tC9jlUdopqutCc
	Ba7jjL9TDV9o2rYKE+DUfnQmqbUAikZ65p8F1ilRaFZbHoHtvO4U/RU2s47LuQTY
	4QiYJe0y6sLKZ12nzY0PSHA7uyZ9Pyxtx4XZZFtymKL4s9+GK0LP0dgkRf/wx0Pt
	3y7OAgzlaXipcEMyO9god2bjfDK7iYtLVlk6niwM5PSbdakOb2DO21MA4LHAZCVt
	MA==
Received: (qmail 5143 invoked from network); 12 Sep 2026 13:12:43 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 12 Sep 2026 13:12:43 +0200
X-UD-Smtp-Session: l3s3148p1@6MOtR0dbupAujnsz
Date: Sat, 12 Sep 2026 13:12:43 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Sam Agazaryan <samagazaryan@google.com>
Cc: linux-i3c@lists.infradead.org,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Frank Li <Frank.Li@nxp.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Vitor Soares <vitor.soares@toradex.com>,
	Oleksandr Shulzhenko <oleksandr.shulzhenko.viktorovych@intel.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 0/3] i3c: Introduce i3c device userspace interface
Message-ID: <aqUzq9MIS8hBFDtD@ninjato>
References: <20260906202747.4041389-1-samagazaryan@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260906202747.4041389-1-samagazaryan@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260912_041250_426315_62A81DBD 
X-CRM114-Status: UNSURE (   6.61  )
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


> [2] https://github.com/vitor-soares-snps/i3c-tools

An idea: because this project only contains 'i3ctransfer' at the moment,
it probably makes sense to provide this tool with the Kernel, placed in
the 'tools' directory? We can seperate it again if it becomes too big or
we want its own community there. But for now, I think it could make
sense unless you want to maintain this repo as well?

Happy hacking!


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
