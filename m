Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4806C433EF
	for <linux-i3c@archiver.kernel.org>; Tue, 17 May 2022 20:36:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CIEkYniTKfFNoCvHXSkJKEQ9Ib+d/X0T2V2n8So6AVs=; b=37G3thkTFJ+hYu
	do5RywmXWQ9VRgC4nxWoEUwdk4yRVV2Rl7kAPio4yb7DjZKBmIV8ALr0JKsFK7dfRUkprME05NRxB
	R8Z5SzNeloSdWc8T7u2+R7txgLR1nvQENlB0v+zt0LNHXulOYXeASK9Kt5ghkfGPLX89i92Q3J3TX
	PRjl+hmlSZD1s3gmAIFFqNHaARGpD/r8ALPJ1d0g9cUDMOKXOn+VOG4AsAXt7GhA0jAKgSU18HAeV
	ezuCMqxfAPLB22ISd5TXhOjW3slYWSfvWk0NK4zz9ZTWRzVx4s1L5ik304udh1hitxPT+X9JgdMQd
	Y66CM+ye9gavw2+a9SYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nr3vw-00FmJE-Gb; Tue, 17 May 2022 20:36:44 +0000
Received: from relay4-d.mail.gandi.net ([2001:4b98:dc4:8::224])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nr3vt-00FmFy-4a
 for linux-i3c@lists.infradead.org; Tue, 17 May 2022 20:36:43 +0000
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 4A0B6E0003;
 Tue, 17 May 2022 20:36:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1652819794;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/JO1WKrEanFG8yQlgaFn0gwBkuYo4ZoO0xQro2sEWa0=;
 b=FvZ1BoSTbXyDg5BmODDrgD9qiZyDGZqE6FR0ZjMffAK1ENIX+Na7kDSb8xtrd9ENVsc27F
 EDTNPDZS5y5BM8gCKt5iaUPFhCDuNUD+Zy1ZIVkmxB5BBnkDSmwqP4W521L/SmR0andZyp
 ZZ7XgagcGx/2Z31EgH+i7LdkibU7sJKzOC3DaGVnKdO6O1heQ7veh4Bv43VTWBFHwajU4G
 cwpdoRUjKScAXM24o+XqXjDwu2lBc4f7sU4DbT8FHgjFaCj1+t9Nb8sDnB/sYVf4rQ27SU
 H+tJWqNh9kmKtOcccjYbkXtlPY+ey/nso4PYmw0Qoo4chT8wj5M5ArYdADjcpw==
From: alexandre.belloni@bootlin.com
To: cgel.zte@gmail.com
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 linux-i3c@lists.infradead.org, Zeal Robot <zealci@zte.com.cn>,
 linux-kernel@vger.kernel.org, Minghao Chi <chi.minghao@zte.com.cn>,
 npitre@baylibre.com
Subject: Re: [PATCH] i3c/master: simplify the return expression of
 i3c_hci_remove()
Date: Tue, 17 May 2022 22:36:31 +0200
Message-Id: <165281969190.286793.17069630958963159233.b4-ty@bootlin.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220505021954.54524-1-chi.minghao@zte.com.cn>
References: <20220505021954.54524-1-chi.minghao@zte.com.cn>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220517_133641_535095_E25E305B 
X-CRM114-Status: UNSURE (   4.80  )
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

From: Alexandre Belloni <alexandre.belloni@bootlin.com>

On Thu, 5 May 2022 02:19:54 +0000, cgel.zte@gmail.com wrote:
> From: Minghao Chi <chi.minghao@zte.com.cn>
> 
> Simplify the return expression.
> 
> 

Applied, thanks!

[1/1] i3c/master: simplify the return expression of i3c_hci_remove()
      commit: c157a606e7525409208a51bd6663d6da3757d69e

Best regards,
-- 
Alexandre Belloni <alexandre.belloni@bootlin.com>

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
